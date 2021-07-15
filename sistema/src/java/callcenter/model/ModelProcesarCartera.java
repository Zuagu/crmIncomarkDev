/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.model;

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;
import org.apache.catalina.tribes.util.Arrays;

/**
 *
 * @author zuagu
 */
public class ModelProcesarCartera {

    public static String lista_archivos() {
        File dir = new File("C:\\Users\\Public");
        String[] ficheros = dir.list();
        JSONArray listArchivos = new JSONArray();

        if (ficheros == null) {
            System.out.println("No hay ficheros en el directorio especificado");
        } else {
            for (int x = 0; x < ficheros.length; x++) {
                listArchivos.add(ficheros[x]);
//                System.out.println(ficheros[x]);
            }
        }
        return listArchivos.toJSONString();

    }

    public static String eliminar_archivo(String nombre_archivo) {

        String filePath = "C:\\Users\\Public\\" + nombre_archivo;
        File storeFile = new File(filePath);
        System.out.println(filePath);

        JSONObject response = new JSONObject();

        if (storeFile.delete()) {
            response.put("message", "El fichero ha sido borrado satisfactoriamente");
        } else {
            response.put("message", "El fichero no puede ser borrado");
        }

        return response.toJSONString();

    }

    public static String lista_eliminacion() {

        try {
            StartConexion ic = new StartConexion();
            String sql = "select * from azteca_relacion_eliminar;";
            System.out.println(sql);
            JSONArray cuentas_malas = new JSONArray();
            ic.rs = ic.st.executeQuery(sql);
            while (ic.rs.next()) {
                JSONObject objCorrect = new JSONObject();
                objCorrect.put("cliente_unico", ic.rs.getString("cliente_unico"));
                objCorrect.put("cols_delete", ic.rs.getString("cols_delete"));
                cuentas_malas.add(objCorrect);
            }

            ic.rs.close();
            ic.st.close();
            ic.conn.close();
            return cuentas_malas.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String enviar_correccion(String cliente_a_corregir, String celda_a_corregir) {

        try {
            StartConexion ic = new StartConexion();
            String sql = "insert into azteca_relacion_eliminar(cliente_unico,cols_delete) values('" + cliente_a_corregir + "','" + celda_a_corregir + "');";
            System.out.println(sql);
            ic.st.executeUpdate(sql);

            JSONObject objCorrect = new JSONObject();
            objCorrect.put("response", "correct");
            
            
            ic.st.close();
            ic.conn.close();

            return objCorrect.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String procesar_cartera() {

        CSVReader reader = null;
        File dir = new File("C:\\Users\\Public\\cartera");
        String[] ficheros = dir.list();

        // Se ocupa una conexion a la base de datos para obtener la relacion de curnta y celda a eliminar
        StartConexion ic = new StartConexion();
        String sql = "select * from azteca_relacion_eliminar;";
        System.out.println(sql);
        JSONArray cuentas_malas = new JSONArray();
        JSONObject objCorrect = new JSONObject();
        try {
            ic.rs = ic.st.executeQuery(sql);
            while (ic.rs.next()) {
                objCorrect.put(ic.rs.getString("cliente_unico"), ic.rs.getString("cols_delete"));
            }
            System.out.println(objCorrect.toJSONString());
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
        // Variables SubLocales
        //----------------------------------------------------------------------
        String[] titulos = {"CLIENTE_UNICO", "NOMBRE_CTE", "RFC_CTE", "GENERO_CLIENTE", "EDAD_CLIENTE", "OCUPACION", "CORREO_ELECTRONICO",
            "DIRECCION_CTE", "NUM_EXT_CTE", "NUM_INT_CTE", "CP_CTE", "COLONIA_CTE", "POBLACION_CTE", "ESTADO_CTE", "TERRITORIO", "GERENCIA",
            "REFERENCIAS_DOMICILIO", "CLASIFICACION_CTE", "ATRASO_MAXIMO", "DIAS_ATRASO", "SALDO", "MORATORIOS", "SALDO_TOTAL", "SALDO_ATRASADO",
            "SALDO_REQUERIDO", "PAGO_PUNTUAL", "PAGO_NORMAL", "PRODUCTO", "FECHA_ULTIMO_PAGO", "IMP_ULTIMO_PAGO", "CALLE_EMPLEO", "NUM_EXT_EMPLEO",
            "NUM_INT_EMPLEO", "COLONIA_EMPLEO", "POBLACION_EMPLEO", "ESTADO_EMPLEO", "NOMBRE_AVAL", "TEL_AVAL", "CALLE_AVAL", "NUM_EXT_AVAL",
            "COLONIA_AVAL", "CP_AVAL", "POBLACION_AVAL", "ESTADO_AVAL", "CLIENTE_GRUPAL", "FIPAISGEO", "FICUADRANTEGEO", "FIZONAGEO", "FIDIAPAGO",
            "FCTELEFONOCELULAR", "TELEFONO1", "TELEFONO2", "TELEFONO3", "TELEFONO4", "TIPOTEL1", "TIPOTEL2", "TIPOTEL3", "TIPOTEL4", "STATUSCYBER",
            "LATITUD", "LONGITUD", "DESPACHO_GESTIONO", "ULTIMA_GESTION", "GESTION_DESC", "CAMPANIA_RELAMPAGO", "CAMPANIA", "TIPO_CARTERA", "ID_GRUPO",
            "GRUPO_MAZ", "CLAVE_SPEI", "PAGOS_CLIENTE", "MONTO_PAGOS", "ESTATUS_PLAN", "GENERACION_PLAN", "CANCELACION_CUMPLIMIENTO_PLAN",
            "ABONO_SEMANAL", "PLAZO", "MONTO_ABONADO", "MONTO_PLAN", "PROXIMO_VENCER", "¿TUVO_REESTRUCTURA?", "FECHA_REESTRUCTURA", "ESTATUS_PROMESA_PAGO",
            "MONTO_PROMESA_PAGO", "GESTOR", "EXTRA1", "EXTRA2", "EXTRA3"};

        // Creamos las Instalcias de los Archivos
        try {
            File file = new File("C:\\Users\\Public\\DATOS_CORREGIDOS.csv");
            File file_datos_separados = new File("C:\\Users\\Public\\CARTERA_SEPARADA.csv");
            File file_cuentas_datos_extra = new File("C:\\Users\\Public\\CARTERA_CUENTAS_DATOS_EXTRA.csv");
            File file_cuentas_no_agregada = new File("C:\\Users\\Public\\CARTERA_CUENTAS_NO_AGREDOS.csv");
            FileWriter outputfile = new FileWriter(file);
            FileWriter output_file_datos_separados = new FileWriter(file_datos_separados);
            FileWriter output_file_cuentas_datos_extra = new FileWriter(file_cuentas_datos_extra);
            FileWriter output_file_cuentas_no_agregada = new FileWriter(file_cuentas_no_agregada);
            CSVWriter writer = new CSVWriter(outputfile);
            CSVWriter writer_SEPARADOS = new CSVWriter(output_file_datos_separados);
            CSVWriter writer_DATOS_EXTRA = new CSVWriter(output_file_cuentas_datos_extra);
            CSVWriter writer_NO_AGREGADO = new CSVWriter(output_file_cuentas_no_agregada);
            String[] header = titulos;
            writer.writeNext(header);
            writer_SEPARADOS.writeNext(header);
            writer_DATOS_EXTRA.writeNext(header);
            writer_NO_AGREGADO.writeNext(header);

            for (String archivo : ficheros) {
                String[] archivo_tipo = archivo.split("\\.");
                // Filtramos para que solo pase archivos CSV
                if (archivo_tipo.length == 2 && archivo_tipo[1].equals("csv")) {
                    System.out.println("Procesando Archivo: " + archivo);
                    try {
                        reader = new CSVReader(new FileReader("C:\\Users\\Public\\cartera\\" + archivo));
                        String[] nextLine;
                        int cels = 0;

                        while ((nextLine = reader.readNext()) != null) {
                            for (String s : nextLine) {
//                    String[] new_row = s.split("\\|");
                                String[] new_row = s.split("[|]");
                                if (new_row.length == 84) {
                                    // Agregamos los que tienen la longitud correcta
                                    writer_SEPARADOS.writeNext(new_row);
                                } else if (new_row.length > 84) {
                                    // Procesamos las cuentas que tienen columnas de mas

                                    if (objCorrect.get(new_row[0]) != null) {

                                        System.out.println("Antes de eliminar: " + new_row.length);
//                            System.out.println(Arrays.toString(new_row));
                                        System.out.println("SE ELIMINA LA POSISION: " + objCorrect.get(new_row[0]).toString());
                                        int eliminar = Integer.parseInt(objCorrect.get(new_row[0]).toString());
                                        String[] conrrect_new_row = new String[new_row.length - 1];
                                        for (int i = 0, j = 0; i < new_row.length; i++) {
//                                System.out.println(i + " " + j);
                                            if (i != eliminar) {
                                                conrrect_new_row[j] = new_row[i];
                                                j++;
                                            }
                                        }
                                        new_row = conrrect_new_row;

                                        System.out.println("Despues de eliminar: " + new_row.length);
//                            System.out.println(Arrays.toString(new_row));
                                        if (new_row.length == 84) {
                                            // Agregamos los que tienen la longitud correcta
                                            writer_SEPARADOS.writeNext(new_row);
                                            writer.writeNext(new_row);
                                        }

                                    } else {

                                        if (!new_row[0].equals("CLIENTE_UNICO")) {
                                            System.out.println("REALCION VISUAL ------------------------------>");
                                            writer_DATOS_EXTRA.writeNext(new_row);
                                            String _data_visual_error = "";
                                            for (String datos : new_row) {
                                                _data_visual_error += cels + " " + titulos[cels] + " : " + datos + "<br>";
//                                            System.out.println(cels + " " + titulos[cels] + " : " + datos);
                                                cels++;
                                            }
                                            cuentas_malas.add(_data_visual_error);
                                        }

                                    }

                                } else {

                                    writer_NO_AGREGADO.writeNext(new_row);
                                }
                                cels = 0;
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }

            }
            writer.close();
            writer_SEPARADOS.close();
            writer_DATOS_EXTRA.close();
            writer_NO_AGREGADO.close();
            System.out.println("Proceso termonado -- FIN -- ");

        } catch (Exception e) {
            e.printStackTrace();
        }

//        try {
        //parsing a CSV file into CSVReader class constructor  
//            reader = new CSVReader(new FileReader("C:\\Users\\Public\\46663_Segmento_16_Part7.csv"));
//            String[] nextLine;
//            int cels = 0;
//            String[] titulos = {"CLIENTE_UNICO", "NOMBRE_CTE", "RFC_CTE", "GENERO_CLIENTE", "EDAD_CLIENTE", "OCUPACION", "CORREO_ELECTRONICO",
//                "DIRECCION_CTE", "NUM_EXT_CTE", "NUM_INT_CTE", "CP_CTE", "COLONIA_CTE", "POBLACION_CTE", "ESTADO_CTE", "TERRITORIO", "GERENCIA",
//                "REFERENCIAS_DOMICILIO", "CLASIFICACION_CTE", "ATRASO_MAXIMO", "DIAS_ATRASO", "SALDO", "MORATORIOS", "SALDO_TOTAL", "SALDO_ATRASADO",
//                "SALDO_REQUERIDO", "PAGO_PUNTUAL", "PAGO_NORMAL", "PRODUCTO", "FECHA_ULTIMO_PAGO", "IMP_ULTIMO_PAGO", "CALLE_EMPLEO", "NUM_EXT_EMPLEO",
//                "NUM_INT_EMPLEO", "COLONIA_EMPLEO", "POBLACION_EMPLEO", "ESTADO_EMPLEO", "NOMBRE_AVAL", "TEL_AVAL", "CALLE_AVAL", "NUM_EXT_AVAL",
//                "COLONIA_AVAL", "CP_AVAL", "POBLACION_AVAL", "ESTADO_AVAL", "CLIENTE_GRUPAL", "FIPAISGEO", "FICUADRANTEGEO", "FIZONAGEO", "FIDIAPAGO",
//                "FCTELEFONOCELULAR", "TELEFONO1", "TELEFONO2", "TELEFONO3", "TELEFONO4", "TIPOTEL1", "TIPOTEL2", "TIPOTEL3", "TIPOTEL4", "STATUSCYBER",
//                "LATITUD", "LONGITUD", "DESPACHO_GESTIONO", "ULTIMA_GESTION", "GESTION_DESC", "CAMPANIA_RELAMPAGO", "CAMPANIA", "TIPO_CARTERA", "ID_GRUPO",
//                "GRUPO_MAZ", "CLAVE_SPEI", "PAGOS_CLIENTE", "MONTO_PAGOS", "ESTATUS_PLAN", "GENERACION_PLAN", "CANCELACION_CUMPLIMIENTO_PLAN",
//                "ABONO_SEMANAL", "PLAZO", "MONTO_ABONADO", "MONTO_PLAN", "PROXIMO_VENCER", "¿TUVO_REESTRUCTURA?", "FECHA_REESTRUCTURA", "ESTATUS_PROMESA_PAGO",
//                "MONTO_PROMESA_PAGO", "GESTOR", "EXTRA1", "EXTRA2", "EXTRA3"};
        // Se ocupa una conexion a la base de datos para obtener la relacion de curnta y celda a eliminar
//            StartConexion ic = new StartConexion();
//            String sql = "select * from azteca_relacion_eliminar;";
//            System.out.println(sql);
//            ic.rs = ic.st.executeQuery(sql);
//            JSONObject objCorrect = new JSONObject();
//            while (ic.rs.next()) // id_registro, cliente_unico, cols_delete
//            {
//                objCorrect.put(ic.rs.getString("cliente_unico"), ic.rs.getString("cols_delete"));
//            }
//            System.out.println(objCorrect.toJSONString());
//            System.out.println(objCorrect.get("1-1-1258-20231"));
//            File file = new File("C:\\Users\\Public\\DATOS_CORREGIDOS.csv");
//            File file_datos_separados = new File("C:\\Users\\Public\\CARTERA_SEPARADA.csv");
//            File file_cuentas_datos_extra = new File("C:\\Users\\Public\\CARTERA_CUENTAS_DATOS_EXTRA.csv");
//            File file_cuentas_no_agregada = new File("C:\\Users\\Public\\CARTERA_CUENTAS_NO_AGREDOS.csv");
//            FileWriter outputfile = new FileWriter(file);
//            FileWriter output_file_datos_separados = new FileWriter(file_datos_separados);
//            FileWriter output_file_cuentas_datos_extra = new FileWriter(file_cuentas_datos_extra);
//            FileWriter output_file_cuentas_no_agregada = new FileWriter(file_cuentas_no_agregada);
//            CSVWriter writer = new CSVWriter(outputfile);
//            CSVWriter writer_SEPARADOS = new CSVWriter(output_file_datos_separados);
//            CSVWriter writer_DATOS_EXTRA = new CSVWriter(output_file_cuentas_datos_extra);
//            CSVWriter writer_NO_AGREGADO = new CSVWriter(output_file_cuentas_no_agregada);
//            String[] header = titulos;
//            writer.writeNext(header);
//            writer_SEPARADOS.writeNext(header);
//            writer_DATOS_EXTRA.writeNext(header);
//            writer_NO_AGREGADO.writeNext(header);
//            while ((nextLine = reader.readNext()) != null) {
//                for (String s : nextLine) {
////                    String[] new_row = s.split("\\|");
//                    String[] new_row = s.split("[|]");
//                    if (new_row.length == 84) {
//                        // Agregamos los que tienen la longitud correcta
//                        writer_SEPARADOS.writeNext(new_row);
//                    } else if (new_row.length > 84) {
//                        // Procesamos las cuentas que tienen columnas de mas
//
//                        if (objCorrect.get(new_row[0]) != null) {
//
//                            System.out.println("Antes de eliminar: " + new_row.length);
////                            System.out.println(Arrays.toString(new_row));
//                            System.out.println("SE ELIMINA LA POSISION: " + objCorrect.get(new_row[0]).toString());
//                            int eliminar = Integer.parseInt(objCorrect.get(new_row[0]).toString());
//                            String[] conrrect_new_row = new String[new_row.length - 1];
//                            for (int i = 0, j = 0; i < new_row.length; i++) {
////                                System.out.println(i + " " + j);
//                                if (i != eliminar) {
//                                    conrrect_new_row[j] = new_row[i];
//                                    j++;
//                                }
//                            }
//                            new_row = conrrect_new_row;
//
//                            System.out.println("Despues de eliminar: " + new_row.length);
////                            System.out.println(Arrays.toString(new_row));
//                            if (new_row.length == 84) {
//                                // Agregamos los que tienen la longitud correcta
//                                writer_SEPARADOS.writeNext(new_row);
//                                writer.writeNext(new_row);
//                            }
//
//                        } else {
//                            System.out.println("REALCION VISUAL ------------------------------>");
//                            writer_DATOS_EXTRA.writeNext(new_row);
////                            for (String datos : new_row) {
////                                System.out.println(cels + " " + titulos[cels] + " : " + datos);
////                                cels++;
////                            }
//                        }
//
//                    } else {
//
//                        writer_NO_AGREGADO.writeNext(new_row);
//                    }
//                    cels = 0;
//                }
////            }
//            writer.close();
//            writer_SEPARADOS.close();
//            writer_DATOS_EXTRA.close();
//            writer_NO_AGREGADO.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return cuentas_malas.toJSONString();
    }

}
