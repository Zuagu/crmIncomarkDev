/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.model;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author zuagu
 */
public class ModelReportesAzteca {

    public static String reporte_convenios_tabla(String desde, String hasta, String territrio, String id_despacho) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "call azteca_reporte_convenios('" + desde + "', '" + hasta + "', '" + territrio + "', '" + id_despacho + "');";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listConvenios = new JSONArray();

            while (ic.rs.next()) {
                JSONObject objConvenio = new JSONObject();
                objConvenio.put("ID_CONVENIO", ic.rs.getString("ID_CONVENIO"));
                objConvenio.put("CONVENIO", ic.rs.getString("CONVENIO"));
                objConvenio.put("RESTO", ic.rs.getString("RESTO"));
                objConvenio.put("APLICA", ic.rs.getString("APLICA"));
                objConvenio.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                objConvenio.put("CANAL", ic.rs.getString("CANAL"));
                objConvenio.put("ATRASO_MAXIMO", ic.rs.getString("ATRASO_MAXIMO"));
                objConvenio.put("FECHA", ic.rs.getString("FECHA"));
                objConvenio.put("USUARIO", ic.rs.getString("USUARIO"));
                objConvenio.put("CUENTA", ic.rs.getString("CUENTA"));
                objConvenio.put("ID_ESTATUS", ic.rs.getString("ID_ESTATUS"));
                objConvenio.put("FECHA_INSET", ic.rs.getString("FECHA_INSET"));
                objConvenio.put("PAGOS", ic.rs.getString("PAGOS"));
                objConvenio.put("FECHA_PAGO", ic.rs.getString("FECHA_PAGO"));
                objConvenio.put("EFECTIVIDAD", ic.rs.getString("EFECTIVIDAD"));
                objConvenio.put("ID_EQUIPO", ic.rs.getString("ID_EQUIPO"));
                objConvenio.put("ID_DESPACHO", ic.rs.getString("ID_DESPACHO"));
                objConvenio.put("ETAPA", ic.rs.getString("ETAPA"));
                listConvenios.add(objConvenio);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return listConvenios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }

    public static String reporte_promesado_diario(String territorio, String desde, String etapa) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "call azteca_promesado_diario('" + territorio + "','" + desde + "','" + etapa + "');";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listConvenios = new JSONArray();
            // GESTOR, CUENTA, NOMBRE, GERENTE, ESTATUS_LLAMADA, CONVENIO, PAGOS, FECHA, ESTATUS_PAGO, FECHA_PAGO
            while (ic.rs.next()) {
                JSONObject objConvenio = new JSONObject();
                objConvenio.put("GESTOR", ic.rs.getString("GESTOR"));
                objConvenio.put("CUENTA", ic.rs.getString("CUENTA"));
                objConvenio.put("NOMBRE", ic.rs.getString("NOMBRE"));
                objConvenio.put("GERENTE", ic.rs.getString("GERENTE"));
                objConvenio.put("ESTATUS_LLAMADA", ic.rs.getString("ESTATUS_LLAMADA"));
                objConvenio.put("CONVENIO", ic.rs.getString("CONVENIO"));
                objConvenio.put("PAGOS", ic.rs.getString("PAGOS"));
                objConvenio.put("FECHA", ic.rs.getString("FECHA"));
                objConvenio.put("ESTATUS_PAGO", ic.rs.getString("ESTATUS_PAGO"));
                objConvenio.put("FECHA_PAGO", ic.rs.getString("FECHA_PAGO"));
                objConvenio.put("ETAPA", ic.rs.getString("ETAPA"));
                listConvenios.add(objConvenio);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();
            return listConvenios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String reporte_promesado_al_momento(String territorio, String desde, String etapa) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "call azteca_prmesado_al_momento('" + territorio + "','" + desde + "','" + etapa + "');";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listConvenios = new JSONArray();
            // TERRITORIO, GESTOR, CUENTA, NOMBRE, GERENTE, ESTATUS_LLAMADA, CONVENIO, FECHA_INSET, HORA, ESTATUS_PAGO, FECHA
            while (ic.rs.next()) {
                JSONObject objConvenio = new JSONObject();
                objConvenio.put("GESTOR", ic.rs.getString("GESTOR"));
                objConvenio.put("CUENTA", ic.rs.getString("CUENTA"));
                objConvenio.put("NOMBRE", ic.rs.getString("NOMBRE"));
                objConvenio.put("GERENTE", ic.rs.getString("GERENTE"));
                objConvenio.put("ESTATUS_LLAMADA", ic.rs.getString("ESTATUS_LLAMADA"));
                objConvenio.put("CONVENIO", ic.rs.getString("CONVENIO"));
                objConvenio.put("FECHA_INSET", ic.rs.getString("FECHA_INSET"));
                objConvenio.put("HORA", ic.rs.getString("HORA"));
                objConvenio.put("ESTATUS_PAGO", ic.rs.getString("ESTATUS_PAGO"));
                objConvenio.put("FECHA", ic.rs.getString("FECHA"));
                objConvenio.put("ETAPA", ic.rs.getString("ETAPA"));
                listConvenios.add(objConvenio);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();
            return listConvenios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String reporte_promesas_incumplidas(String desde) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "call azteca_promesas_incumplidas('" + desde + "');";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listConvenios = new JSONArray();
            // GERENTE, TOTAL, FECHA, ID_ESTATUS
            while (ic.rs.next()) {
                JSONObject objConvenio = new JSONObject();
                objConvenio.put("GERENTE", ic.rs.getString("GERENTE"));
                objConvenio.put("TOTAL", ic.rs.getString("TOTAL"));
                objConvenio.put("FECHA", ic.rs.getString("FECHA"));
                objConvenio.put("ID_ESTATUS", ic.rs.getString("ID_ESTATUS"));
                objConvenio.put("DIA_SEM", ic.rs.getString("DIA_SEM"));
                listConvenios.add(objConvenio);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();
            return listConvenios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String reporte_promesas_por_gestor(String f_inicio) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "call azteca_recuperacion_por_gestor('" + f_inicio + "');";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listConvenios = new JSONArray();
            // GESTOR, CONVENIO, PAGOS, FECHA
            while (ic.rs.next()) {
                JSONObject objConvenio = new JSONObject();
                objConvenio.put("GESTOR", ic.rs.getString("GESTOR"));
                objConvenio.put("CONVENIO", ic.rs.getString("CONVENIO"));
                objConvenio.put("PAGOS", ic.rs.getString("PAGOS"));
                objConvenio.put("FECHA", ic.rs.getString("FECHA"));
                objConvenio.put("DIA_SEM", ic.rs.getString("DIA_SEM"));
                listConvenios.add(objConvenio);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();
            return listConvenios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String reporte_gestiones_tabla(String desde, String hasta, String territrio, String etapa) {
        try {
// ID_GESTION, HORA, TERRITORIO, CANAL, FECHA_LARGA, ATRASO_MAXIMO, CUENTA, NUMERO_MARCADO, 
// ID_ESTATUS_CUENTA, ID_ESTATUS_LLAMADA, USUARIO, GESTION, DURACION, RETASO, PROMESA, F_PREDICTIVO, ETAPA
            StartConexion ic = new StartConexion();
            String sql = "call azteca_reporte_gestiones('" + desde + "', '" + hasta + "', '" + territrio + "', '" + etapa + "');";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listGestiones = new JSONArray();

            while (ic.rs.next()) {
                JSONObject objGestion = new JSONObject();
                objGestion.put("ID_GESTION", ic.rs.getString("ID_GESTION"));
                objGestion.put("HORA", ic.rs.getString("HORA"));
                objGestion.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                objGestion.put("CANAL", ic.rs.getString("CANAL"));
                objGestion.put("FECHA_LARGA", ic.rs.getString("FECHA_LARGA"));
                objGestion.put("ATRASO_MAXIMO", ic.rs.getString("ATRASO_MAXIMO"));
                objGestion.put("CUENTA", ic.rs.getString("CUENTA"));
                objGestion.put("NUMERO_MARCADO", ic.rs.getString("NUMERO_MARCADO"));
                objGestion.put("ID_ESTATUS_CUENTA", ic.rs.getString("ID_ESTATUS_CUENTA"));
                objGestion.put("ID_ESTATUS_LLAMADA", ic.rs.getString("ID_ESTATUS_LLAMADA"));
                objGestion.put("USUARIO", ic.rs.getString("USUARIO"));
                objGestion.put("GESTION", ic.rs.getString("GESTION"));
                objGestion.put("DURACION", ic.rs.getString("DURACION"));
                objGestion.put("RETASO", ic.rs.getString("RETASO"));
                objGestion.put("PROMESA", ic.rs.getString("PROMESA"));
                objGestion.put("F_PREDICTIVO", ic.rs.getString("F_PREDICTIVO"));
                objGestion.put("ETAPA", ic.rs.getString("ETAPA"));
                objGestion.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                objGestion.put("GERENTE", ic.rs.getString("GERENTE"));
                objGestion.put("GERENCIA", ic.rs.getString("GERENCIA"));
                listGestiones.add(objGestion);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return listGestiones.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }

    public static String reporte_gestiones_descarga(String desde, String hasta, String territrio, String etapa) throws IOException {
//        String filename = "/var/lib/tomcat8/webapps/sistema/excel/GestionesBaseCrm.csv";
        String filename = "/opt/tomcat/webapps/sistema/excel/GestionesBaseCrm.csv";
//        String filename = "C:\\Users\\Public\\GestionesBaseCrm.csv";
        System.out.println("FILE NAME: " + filename);
        try {
            StartConexion ic = new StartConexion();
            FileWriter fw = new FileWriter(filename);
            String sql = "call azteca_reporte_gestiones('" + desde + "', '" + hasta + "', '" + territrio + "', '" + etapa + "');";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);

            fw.append("ID_GESTION");
            fw.append(',');
            fw.append("HORA");
            fw.append(',');
            fw.append("TERRITORIO");
            fw.append(',');
            fw.append("CANAL");
            fw.append(',');
            fw.append("FECHA_LARGA");
            fw.append(',');
            fw.append("ATRASO_MAXIMO");
            fw.append(',');
            fw.append("CUENTA");
            fw.append(',');
            fw.append("NUMERO_MARCADO");
            fw.append(',');
            fw.append("ID_ESTATUS_CUENTA");
            fw.append(',');
            fw.append("ID_ESTATUS_LLAMADA");
            fw.append(',');
            fw.append("USUARIO");
            fw.append(',');
            fw.append("GESTION");
            fw.append(',');
            fw.append("DURACION");
            fw.append(',');
            fw.append("RETASO");
            fw.append(',');
            fw.append("PROMESA");
            fw.append(',');
            fw.append("F_PREDICTIVO");
            fw.append(',');
            fw.append("ETAPA");
            fw.append(',');
            fw.append("GERENCIA");
            fw.append(',');
            fw.append("GERENTE");
            fw.append('\n');

            while (ic.rs.next()) {
                JSONObject objGestion = new JSONObject();
                fw.append(ic.rs.getString("ID_GESTION"));
                fw.append(',');
                fw.append(ic.rs.getString("HORA"));
                fw.append(',');
                fw.append(ic.rs.getString("TERRITORIO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("CANAL").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("FECHA_LARGA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("ATRASO_MAXIMO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("CUENTA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("NUMERO_MARCADO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("ID_ESTATUS_CUENTA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("ID_ESTATUS_LLAMADA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("USUARIO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("GESTION").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("DURACION").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("RETASO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("PROMESA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("F_PREDICTIVO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("ETAPA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("GERENCIA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("GERENTE").replace("\n", ""));
                fw.append('\n');
            }

            fw.flush();
            fw.close();

            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return "{\"response\":\"Archivo CSV generado\"}";
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String reporte_convenios_descarga(String desde, String hasta, String territrio, String etapa) throws IOException {
//        String filename = "/var/lib/tomcat8/webapps/sistema/excel/ConveniosBaseCrm.csv";
        String filename = "/opt/tomcat/webapps/sistema/excel/ConveniosBaseCrm.csv";
//        String filename = "C:\\Users\\Public\\ConveniosBaseCrm.csv";
        System.out.println("FILE NAME: " + filename);
        try {

            StartConexion ic = new StartConexion();

            FileWriter fw = new FileWriter(filename);
            String sql = "call azteca_reporte_convenios('" + desde + "', '" + hasta + "', '" + territrio + "', '" + etapa + "');";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);

            fw.append("ID_CONVENIO");
            fw.append(',');
            fw.append("CONVENIO");
            fw.append(',');
            fw.append("RESTO");
            fw.append(',');
            fw.append("APLICA");
            fw.append(',');
            fw.append("TERRITORIO");
            fw.append(',');
            fw.append("CANAL");
            fw.append(',');
            fw.append("ATRASO_MAXIMO");
            fw.append(',');
            fw.append("FECHA");
            fw.append(',');
            fw.append("USUARIO");
            fw.append(',');
            fw.append("CUENTA");
            fw.append(',');
            fw.append("ID_ESTATUS");
            fw.append(',');
            fw.append("FECHA_INSET");
            fw.append(',');
            fw.append("PAGOS");
            fw.append(',');
            fw.append("FECHA_PAGO");
            fw.append(',');
            fw.append("EFECTIVIDAD");
            fw.append(',');
            fw.append("ID_EQUIPO");
            fw.append(',');
            fw.append("ETAPA");
            fw.append('\n');

            while (ic.rs.next()) {
                fw.append(ic.rs.getString("ID_CONVENIO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("CONVENIO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("RESTO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("APLICA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("TERRITORIO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("CANAL").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("ATRASO_MAXIMO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("FECHA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("USUARIO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("CUENTA").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("ID_ESTATUS").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("FECHA_INSET").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("PAGOS").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("FECHA_PAGO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("EFECTIVIDAD").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("ID_EQUIPO").replace("\n", ""));
                fw.append(',');
                fw.append(ic.rs.getString("ETAPA").replace("\n", ""));
                fw.append('\n');
            }

            fw.flush();
            fw.close();

            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return "{\"response\":\"Archivo CSV generado\"}";
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }

    public static String azteca_reporte_operacion_descarga(String desde, String hasta) throws IOException {
//        String filename = "/var/lib/tomcat8/webapps/sistema/excel/ReporteOperacionBaseCrm.csv";
        String filename = "/opt/tomcat/webapps/sistema/excel/ReporteOperacionBaseCrm.csv";
//        String filename = "C:\\Users\\Public\\ReporteOperacionBaseCrm.csv";
        System.out.println("FILE NAME: " + filename);
        try {
            StartConexion ic = new StartConexion();

            FileWriter fw = new FileWriter(filename);

            String sql = "SELECT \n"
                    + "	tu.id_usuario,\n"
                    + "    u.nombre,\n"
                    + "    tu.fecha,\n"
                    + "    tu.hora_inicial,\n"
                    + "    tu.tiempo_conectado,\n"
                    + "    week(tu.fecha) as semana\n"
                    + "FROM azteca_tiempos_usuarios tu\n"
                    + "left join arcade_usuarios u on tu.id_usuario = u.id\n"
                    + "where  fecha between '" + desde + "' and '" + hasta + "';";
            System.out.println(sql);

            fw.append("id_usuario");
            fw.append(',');
            fw.append("nombre");
            fw.append(',');
            fw.append("fecha");
            fw.append(',');
            fw.append("hora_inicial");
            fw.append(',');
            fw.append("tiempo_conectado");
            fw.append(',');
            fw.append("semana");
            fw.append('\n');

            ic.rs = ic.st.executeQuery(sql);

            while (ic.rs.next()) {
                fw.append(ic.rs.getString("id_usuario"));
                fw.append(',');
                fw.append(ic.rs.getString("nombre"));
                fw.append(',');
                fw.append(ic.rs.getString("fecha"));
                fw.append(',');
                fw.append(ic.rs.getString("hora_inicial"));
                fw.append(',');
                fw.append(ic.rs.getString("tiempo_conectado"));
                fw.append(',');
                fw.append(ic.rs.getString("semana"));
                fw.append('\n');
            }

            fw.flush();
            fw.close();

            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return "{\"response\":\"Archivo CSV generado\"}";
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }

    public static String azteca_reporte_operacion(String desde, String hasta) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT \n"
                    + "	tu.id_usuario,\n"
                    + "    u.nombre,\n"
                    + "    tu.fecha,\n"
                    + "    tu.hora_inicial,\n"
                    + "    tu.tiempo_conectado,\n"
                    + "    week(tu.fecha) as semana\n"
                    + "FROM azteca_tiempos_usuarios tu\n"
                    + "left join arcade_usuarios u on tu.id_usuario = u.id\n"
                    + "where  fecha between '" + desde + "' and '" + hasta + "';";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listUsu = new JSONArray();

            while (ic.rs.next()) {
                JSONObject usu = new JSONObject();
                usu.put("id_usuario", ic.rs.getString("id_usuario"));
                usu.put("nombre", ic.rs.getString("nombre"));
                usu.put("fecha", ic.rs.getString("fecha"));
                usu.put("hora_inicial", ic.rs.getString("hora_inicial"));
                usu.put("tiempo_conectado", ic.rs.getString("tiempo_conectado"));
                usu.put("semana", ic.rs.getString("semana"));
                listUsu.add(usu);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return listUsu.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }

    public static String azteca_reporte_pagos(String desde, String hasta, String zona, String etapa) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "call azteca_reporte_pagos('" + desde + "', '" + hasta + "',  '" + zona + "',  '" + etapa + "')";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listPagos = new JSONArray();

            while (ic.rs.next()) {
                JSONObject objPago = new JSONObject();
                objPago.put("ID_PAGO", ic.rs.getString("ID_PAGO"));
                objPago.put("DIA", ic.rs.getString("DIA"));
                objPago.put("RECUPERACION_CAPITAL", ic.rs.getString("RECUPERACION_CAPITAL"));
                objPago.put("RECUPERACION_MORATORIOS", ic.rs.getString("RECUPERACION_MORATORIOS"));
                objPago.put("SALDO_ACTUAL", ic.rs.getString("SALDO_ACTUAL"));
                objPago.put("MORATORIO", ic.rs.getString("MORATORIO"));
                objPago.put("FECHA_GESTION", ic.rs.getString("FECHA_GESTION"));
                objPago.put("CARGO_AUTOMATICO", ic.rs.getString("CARGO_AUTOMATICO"));
                objPago.put("CLIENTE_UNICO", ic.rs.getString("CLIENTE_UNICO"));
                objPago.put("ETAPA", ic.rs.getString("ETAPA"));
                objPago.put("ZONA", ic.rs.getString("ZONA"));
                objPago.put("GERENTE", ic.rs.getString("GERENTE"));
                objPago.put("GERENCIA", ic.rs.getString("GERENCIA"));
                objPago.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                objPago.put("ID_GESTOR", ic.rs.getString("ID_GESTOR"));
                listPagos.add(objPago);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return listPagos.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }
    // =========================================================================

    public static String select_territorios() {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT count(CLIENTE_UNICO) as catidad,TERRITORIO FROM azteca_base_genenral_original where IDENTIFICADOR != '0' GROUP BY TERRITORIO ;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listterri = new JSONArray();
            while (ic.rs.next()) {
                JSONObject territorio = new JSONObject();
                territorio.put("catidad", ic.rs.getString("catidad"));
                territorio.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                listterri.add(territorio);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return listterri.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String select_gerentes(String _territorios) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT count(CLIENTE_UNICO) as catidad,GERENTE FROM azteca_base_genenral_original where IDENTIFICADOR != '0' and TERRITORIO in (" + _territorios.replace("\"", "'") + ") GROUP BY GERENTE;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listgerentes = new JSONArray();
            while (ic.rs.next()) {
                JSONObject gerentes = new JSONObject();
                gerentes.put("catidad", ic.rs.getString("catidad"));
                gerentes.put("GERENTE", ic.rs.getString("GERENTE"));
                listgerentes.add(gerentes);

            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return listgerentes.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String select_gerencias(String _territorios, String _gerentes) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT count(CLIENTE_UNICO) as catidad,GERENCIA FROM azteca_base_genenral_original where IDENTIFICADOR != '0' and TERRITORIO in (" + _territorios.replace("\"", "'") + ") and GERENTE in (" + _gerentes.replace("\"", "'") + ") GROUP BY GERENCIA;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listgerencias = new JSONArray();
            while (ic.rs.next()) {
                JSONObject gerencias = new JSONObject();
                gerencias.put("catidad", ic.rs.getString("catidad"));
                gerencias.put("GERENCIA", ic.rs.getString("GERENCIA"));
                listgerencias.add(gerencias);

            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return listgerencias.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String generar_csv_telefonos(String _tipo_base, String territorio, String gerente, String gerencia) throws IOException {

//        String filename = "/var/lib/tomcat8/webapps/sistema/excel/NumerosBaseCrm.csv";
        String filename = "/opt/tomcat/webapps/sistema/excel/NumerosBaseCrm.csv";
        // /var/lib/tomcat8/webapps/sistema/excel
//        String filename = "C:\\Users\\Public\\NumerosBaseCrm.csv";
        System.out.println("FILE NAME: " + filename);

        try {
            String resultado;
            FileWriter fw = new FileWriter(filename);
            StartConexion s = new StartConexion();
            String sql;
            if (_tipo_base.equals("completo")) {
                sql = "select CLIENTE_UNICO,NOMBRE_CTE,\n"
                        + "ifnull(NOM_TEL1,'') as NOM_TEL1,ifnull(TELEFONO1,'') as TELEFONO1, ifnull(TELEFONO1_2,'') as TELEFONO1_2,\n"
                        + "ifnull(NOM_TEL2,'') as NOM_TEL2,ifnull(TELEFONO2,'') as TELEFONO2, ifnull(TELEFONO2_2,'') as TELEFONO2_2,\n"
                        + "ifnull(NOM_TEL3,'') as NOM_TEL3,ifnull(TELEFONO3,'') as TELEFONO3, ifnull(TELEFONO3_2,'') as TELEFONO3_2,\n"
                        + "ifnull(NOM_TEL4,'') as NOM_TEL4,ifnull(TELEFONO4,'') as TELEFONO4, ifnull(TELEFONO4_2,'') as TELEFONO4_2,\n"
                        + "ifnull(NOM_TEL5,'') as NOM_TEL5,ifnull(TELEFONO5,'') as TELEFONO5, ifnull(TELEFONO5_2,'') as TELEFONO5_2,\n"
                        + "ifnull(NOMBRE_AVAL,'') as NOMBRE_AVAL,ifnull(TELAVAL,'') as TELAVAL, ifnull(TELAVAL2,'') as TELAVAL2 \n"
                        + "from azteca_base_genenral_original where IDENTIFICADOR != '0'";

            } else if (_tipo_base.equals("medio_completo")) {
                sql = "select CLIENTE_UNICO,NOMBRE_CTE,\n"
                        + "ifnull(NOM_TEL1,'') as NOM_TEL1,ifnull(TELEFONO1,'') as TELEFONO1, ifnull(TELEFONO1_2,'') as TELEFONO1_2,\n"
                        + "ifnull(NOM_TEL2,'') as NOM_TEL2,ifnull(TELEFONO2,'') as TELEFONO2, ifnull(TELEFONO2_2,'') as TELEFONO2_2,\n"
                        + "ifnull(NOM_TEL3,'') as NOM_TEL3,ifnull(TELEFONO3,'') as TELEFONO3, ifnull(TELEFONO3_2,'') as TELEFONO3_2,\n"
                        + "ifnull(NOM_TEL4,'') as NOM_TEL4,ifnull(TELEFONO4,'') as TELEFONO4, ifnull(TELEFONO4_2,'') as TELEFONO4_2,\n"
                        + "ifnull(NOM_TEL5,'') as NOM_TEL5,ifnull(TELEFONO5,'') as TELEFONO5, ifnull(TELEFONO5_2,'') as TELEFONO5_2,\n"
                        + "ifnull(NOMBRE_AVAL,'') as NOMBRE_AVAL,ifnull(TELAVAL,'') as TELAVAL, ifnull(TELAVAL2,'') as TELAVAL2 \n"
                        + "from azteca_base_genenral_original where IDENTIFICADOR != '0' and TERRITORIO in (" + territorio.replace("\"", "'") + ") and GERENTE in (" + gerente.replace("\"", "'") + ");";

            } else {
                sql = "select CLIENTE_UNICO,NOMBRE_CTE,\n"
                        + "ifnull(NOM_TEL1,'') as NOM_TEL1,ifnull(TELEFONO1,'') as TELEFONO1, ifnull(TELEFONO1_2,'') as TELEFONO1_2,\n"
                        + "ifnull(NOM_TEL2,'') as NOM_TEL2,ifnull(TELEFONO2,'') as TELEFONO2, ifnull(TELEFONO2_2,'') as TELEFONO2_2,\n"
                        + "ifnull(NOM_TEL3,'') as NOM_TEL3,ifnull(TELEFONO3,'') as TELEFONO3, ifnull(TELEFONO3_2,'') as TELEFONO3_2,\n"
                        + "ifnull(NOM_TEL4,'') as NOM_TEL4,ifnull(TELEFONO4,'') as TELEFONO4, ifnull(TELEFONO4_2,'') as TELEFONO4_2,\n"
                        + "ifnull(NOM_TEL5,'') as NOM_TEL5,ifnull(TELEFONO5,'') as TELEFONO5, ifnull(TELEFONO5_2,'') as TELEFONO5_2,\n"
                        + "ifnull(NOMBRE_AVAL,'') as NOMBRE_AVAL,ifnull(TELAVAL,'') as TELAVAL, ifnull(TELAVAL2,'') as TELAVAL2 \n"
                        + "from azteca_base_genenral_original where IDENTIFICADOR != '0' and TERRITORIO in (" + territorio.replace("\"", "'") + ") and GERENTE in (" + gerente.replace("\"", "'") + ") and GERENCIA in ('" + gerencia.replace("\"", "'") + "');";

            }

            System.out.println(sql);

            fw.append("CLIENTE_UNICO");
            fw.append(',');
            fw.append("NOMBRE_CTE");
            fw.append(',');
            fw.append("TELEFONO");
            fw.append(',');
            fw.append("NOMBRE CONTACTO");
            fw.append(',');
            fw.append("CONTRACTO");
            fw.append('\n');

            s.rs = s.st.executeQuery(sql);

            ArrayList<ArrayList<String>> aNumeros = new ArrayList<ArrayList<String>>();
            String[] columnas = {"CLIENTE_UNICO", "NOMBRE_CTE", "NOM_TEL1", "TELEFONO1", "TELEFONO1_2", "NOM_TEL2",
                "TELEFONO2", "TELEFONO2_2", "NOM_TEL3", "TELEFONO3", "TELEFONO3_2", "NOM_TEL4", "TELEFONO4",
                "TELEFONO4_2", "NOM_TEL5", "TELEFONO5", "TELEFONO5_2", "NOMBRE_AVAL", "TELAVAL", "TELAVAL2"};

            while (s.rs.next()) {

                ArrayList<String> cuenta = new ArrayList<String>();
                cuenta.add(s.rs.getString("CLIENTE_UNICO"));
                cuenta.add(s.rs.getString("NOMBRE_CTE").replace("\n", ""));
                cuenta.add(s.rs.getString("NOM_TEL1").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO1").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO1_2").replace("\n", ""));
                cuenta.add(s.rs.getString("NOM_TEL2").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO2").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO2_2").replace("\n", ""));
                cuenta.add(s.rs.getString("NOM_TEL3").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO3").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO3_2").replace("\n", ""));
                cuenta.add(s.rs.getString("NOM_TEL4").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO4").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO4_2").replace("\n", ""));
                cuenta.add(s.rs.getString("NOM_TEL5").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO5").replace("\n", ""));
                cuenta.add(s.rs.getString("TELEFONO5_2").replace("\n", ""));
                cuenta.add(s.rs.getString("NOMBRE_AVAL").replace("\n", ""));
                cuenta.add(s.rs.getString("TELAVAL").replace("\n", ""));
                cuenta.add(s.rs.getString("TELAVAL2").replace("\n", ""));

                aNumeros.add(cuenta);

            }

            for (int i = 0; i < aNumeros.size(); i++) {
                String nombre = "";
                for (int j = 2; j < aNumeros.get(i).size(); j++) {

                    if (!aNumeros.get(i).get(j).equals("")
                            && !aNumeros.get(i).get(j).equals("SIN INFORMACION")
                            && !aNumeros.get(i).get(j).equals("SIN TELEFONO AVAL")
                            && !aNumeros.get(i).get(j).equals("0")) {
                        if (j == 2 || j == 5 || j == 8 || j == 11 || j == 14 || j == 17) {
                            nombre = aNumeros.get(i).get(j);
                        } else {
                            fw.append(aNumeros.get(i).get(0));
                            fw.append(',');
                            fw.append(aNumeros.get(i).get(1));
                            fw.append(',');
                            fw.append(aNumeros.get(i).get(j));
                            fw.append(',');
                            fw.append(nombre);
                            fw.append(',');
                            fw.append(columnas[j]);
                            fw.append('\n');
//                            System.out.println(aNumeros.get(i).get(0) + " " + j + ".- " + aNumeros.get(i).get(j) + " tit:" + aNumeros.get(i).get(1) + " nom_ref:" + nombre);
                        }
                    }
                }
//                System.out.println();
            }

            fw.flush();
            fw.close();
//            System.out.println(aNumeros.toString());
            s.rs.close();
            s.st.close();
            s.conn.close();
            resultado = "{\"response\":\"Se ha generado la base general en CSV de manera correcta.\"}";
            return resultado;
        } catch (SQLException ex) {
            return "SQL COde:" + ex;
        }
    }

    // =========================================================================
    public static String select_options_territorios() {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT TERRITORIO FROM azteca_base_genenral_original where IDENTIFICADOR != '0' GROUP BY TERRITORIO;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray territorios = new JSONArray();
            while (ic.rs.next()) {
                territorios.add(ic.rs.getString("TERRITORIO"));
//                objCuenta.put("id_cuenta", ic.rs.getInt("id_cuenta"));

            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return territorios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    // =========================================================================
    public static String select_clientes_cartera() {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT ETAPA FROM azteca_base_genenral_original where IDENTIFICADOR != '0' group by ETAPA;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray clientes_cartera = new JSONArray();
            while (ic.rs.next()) {
                JSONObject cliente = new JSONObject();
                cliente.put("ETAPA", ic.rs.getString("ETAPA"));
                clientes_cartera.add(cliente);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return clientes_cartera.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al seleccionar clientes cartera : " + e;
        }
    }

    public static String select_options_territorios_convenios() {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT TERRITORIO FROM azteca_convenios GROUP BY TERRITORIO;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray territorios = new JSONArray();
            while (ic.rs.next()) {
                territorios.add(ic.rs.getString("TERRITORIO"));
//                objCuenta.put("id_cuenta", ic.rs.getInt("id_cuenta"));

            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return territorios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String select_options_zona() {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT ZONA FROM azteca_pagos GROUP BY ZONA;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray territorios = new JSONArray();
            while (ic.rs.next()) {
                territorios.add(ic.rs.getString("ZONA"));
//                objCuenta.put("id_cuenta", ic.rs.getInt("id_cuenta"));

            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return territorios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }

    public static String select_options_territorios(String objContacto) {
        try {
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(objContacto);

            Object _CUENTA = jsonObject.get("_CUENTA");

            StartConexion ic = new StartConexion();
            String sql = "CALL azteca_reporte_convenios();";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONObject objCuenta = new JSONObject();
            while (ic.rs.next()) {
//                objCuenta.put("id_cuenta", ic.rs.getInt("id_cuenta"));

            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return jsonObject.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        } catch (org.json.simple.parser.ParseException ex) {
            Logger.getLogger(ModelGestor.class.getName()).log(Level.SEVERE, null, ex);
            return "SQL: Falla en el parser de JSONObject";
        }

    }

    public static String descargar_base() throws IOException {

//        String filename = "/var/lib/tomcat8/webapps/sistema/excel/BaseAztecaCrm.csv";
        String filename = "/opt/tomcat/webapps/sistema/excel/BaseAztecaCrm.csv";
//        String filename = "C:\\Users\\Public\\BaseAztecaCrm.csv";
        System.out.println("FILE NAME: " + filename);

        try {
            String resultado;
            FileWriter fw = new FileWriter(filename);
            StartConexion s = new StartConexion();
            String sql = "call azteca_base_maestra();";
            System.out.println(sql);

            fw.append("CLIENTE_UNICO");
            fw.append(',');
            fw.append("PLAN");
            fw.append(',');
            fw.append("INTENCION_DE_PAGO");
            fw.append(',');
            fw.append("MEJOR_ESTATUS_LLAMADA");
            fw.append(',');
            fw.append("GRUPO");
            fw.append(',');
            fw.append("NOMBRE_CTE");
            fw.append(',');
            fw.append("EDAD");
            fw.append(',');
            fw.append("RANGO_DE_EDAD");
            fw.append(',');
            fw.append("ATRASO_MAXIMO");
            fw.append(',');
            fw.append("ETAPA");
            fw.append(',');
            fw.append("SCORE");
            fw.append(',');
            fw.append("SALDO");
            fw.append(',');
            fw.append("RANGO");
            fw.append(',');
            fw.append("MORATORIOS");
            fw.append(',');
            fw.append("SALDO_TOTAL");
            fw.append(',');
            fw.append("TERRITORIO");
            fw.append(',');
            fw.append("GERENTE");
            fw.append(',');
            fw.append("GERENCIA");
            fw.append(',');
            fw.append("DIA_DE_PAGO");
            fw.append(',');
            fw.append("PRODUCTO");
            fw.append(',');
            fw.append("MICRO");
            fw.append(',');
            fw.append("ITALICA");
            fw.append(',');
            fw.append("CANAL");
            fw.append(',');
            fw.append("FECHA_ULTIMO_PAGO");
            fw.append(',');
            fw.append("ANO_PAGO");
            fw.append(',');
            fw.append("IMP_ULTIMO_PAGO");
            fw.append(',');
            fw.append("ESTADOAVAL");
            fw.append(',');
            fw.append("NOMBRE_AVAL");
            fw.append(',');
            fw.append("MIGRADO_A_CYBER");
            fw.append(',');
            fw.append("CUADRANTE");
            fw.append(',');
            fw.append("ZONA_GEO");
            fw.append(',');
            fw.append("RFC_CTE");
            fw.append(',');
            fw.append("IDENTIFICADOR");
            fw.append(',');
            fw.append("ESTATUS_LLAMADA_ACTUAL");
            fw.append(',');
            fw.append("FECHA_ULTIMA_GESTION");
            fw.append(',');
            fw.append("HORA_ULTIMA_GESTION");
            fw.append('\n');

            String regex = "\r|\n";

            s.rs = s.st.executeQuery(sql);
            while (s.rs.next()) {
                fw.append(s.rs.getString("CLIENTE_UNICO"));
                fw.append(',');
                fw.append(s.rs.getString("PLAN").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("INTENCION_DE_PAGO").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("MEJOR_ESTATUS_LLAMADA").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("GRUPO").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("NOMBRE_CTE").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("EDAD").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("RANGO_DE_EDAD").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("ATRASO_MAXIMO").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("ETAPA").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("SCORE").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("SALDO").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("RANGO").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("MORATORIOS").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("SALDO_TOTAL").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("TERRITORIO").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("GERENTE").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("GERENCIA").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("DIA_DE_PAGO").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("PRODUCTO").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("MICRO").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("ITALICA").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("CANAL").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("FECHA_ULTIMO_PAGO").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("ANO_PAGO").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("IMP_ULTIMO_PAGO").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("ESTADOAVAL").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("NOMBRE_AVAL").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("MIGRADO_A_CYBER").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("CUADRANTE").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("ZONA_GEO").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("RFC_CTE").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("IDENTIFICADOR2").replaceAll(regex, ""));
                fw.append(',');
                fw.append(s.rs.getString("ESTATUS_LLAMADA_ACTUAL").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("FECHA_ULTIMA_GESTION").replace("\n", ""));
                fw.append(',');
                fw.append(s.rs.getString("HORA_ULTIMA_GESTION").replace("\n", ""));
                fw.append('\n');
            }

            fw.flush();
            fw.close();

            s.rs.close();
            s.st.close();
            s.conn.close();
            resultado = "{\"response\":\"Se ha generado la base general en CSV de manera correcta.\"}";
            return resultado;
        } catch (SQLException ex) {
            return "SQL COde:" + ex;
        }
    }

    public static String select_reporte_llamadas(String territorio, String etapa, String desde, String hasta) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "select\n"
                    + "	g.ID_USUARIO,\n"
                    + "	g.TERRITORIO,\n"
                    + "    b.ETAPA,\n"
                    + "	ifnull(nombre_usuario_alias(g.ID_USUARIO),'NO REGISTRADO') as gestor,\n"
                    + "    sum(g.ID_ESTATUS_LLAMADA in (19,22,23,24,25) ) as PP, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (12, 13)) as CT, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA = 9) as CLL,\n"
                    + "	sum(g.ID_ESTATUS_LLAMADA=16) as SG, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (27, 28)) as PI,\n"
                    + "	sum(g.ID_ESTATUS_LLAMADA = 30) as PT, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA=6) as NO, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA=29) as FI, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA=26) as PC, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA=21) as PA, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA=20) as RE, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (17,18)) as ND,\n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (15)) as NP, \n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (11)) as BZ,\n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (3,4,8)) as NE,\n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (10)) as CN,\n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (7)) as NL,\n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (5)) as NC,\n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (2)) as SD,\n"
                    + "	sum(g.ID_ESTATUS_LLAMADA in (1)) as SG,\n"
                    + "    sum(g.id_estatus_llamada in (19,22,23,24,25,12,13,9,16,27,28,30,6,29,26,21,20,17,18,15,11,3,4,8,10,7,5,2,1)) as suma,\n"
                    + "    format(count( distinct(g.cuenta)) ,0) as cuentas,\n"
                    + "    format(ifnull((sum(g.id_estatus_llamada in (12,13,16,17,18,19,21,22,23,24,25,28)) /\n"
                    + "    sum(g.id_estatus_llamada in (19,22,23,24,25,12,13,9,16,27,28,30,6,29,26,21,20,17,18,15,11,3,4,8,10,7,5,2,1)) * 100),0.00), 2) as contacto,\n"
                    + "	ifnull(promesado_por_gestor(g.ID_USUARIO, '" + desde + "','" + hasta + "'), 0.00) as promesado,\n"
                    + "	ifnull(pagado_por_gestor(g.ID_USUARIO, '" + desde + "','" + hasta + "'), 0.00) as pagado,\n"
                    + "	sum(1) as total_general, datediff('" + hasta + "','" + desde + "') + 1 as dias, \n"
                    + "    'dato' as color\n"
                    + "    -- concat('$',format(promesado_gestor(id_asignacion, id_gestor, _desde, _hasta),2)) as promesado\n"
                    + "from\n"
                    + "	azteca_gestiones g\n"
                    + "left join azteca_base_genenral_original b on b.CLIENTE_UNICO = g.CUENTA\n"
                    + "where \n"
                    + "IF ( concat(" + territorio + ") = '0', g.TERRITORIO LIKE '%%' ,  g.TERRITORIO in (" + territorio + ") )\n"
                    + "and IF ( concat(" + etapa + ") = '0', b.ETAPA LIKE '%%' , b.ETAPA in (" + etapa + ") )\n"
                    + "AND date(g.FECHA_LARGA) between '" + desde + "' and '" + hasta + "' \n"
                    + "-- and id_region = _id_region\n"
                    + "and g.ID_USUARIO != '1'\n"
                    + "group by g.ID_USUARIO ;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray usuarios = new JSONArray();
            while (ic.rs.next()) {
                // 
                JSONObject objUsuario = new JSONObject();
                objUsuario.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                objUsuario.put("gestor", ic.rs.getString("gestor"));
                objUsuario.put("PP", ic.rs.getString("PP"));
                objUsuario.put("CT", ic.rs.getString("CT"));
                objUsuario.put("CLL", ic.rs.getString("CLL"));
                objUsuario.put("SG", ic.rs.getString("SG"));
                objUsuario.put("PI", ic.rs.getString("PI"));
                objUsuario.put("PT", ic.rs.getString("PT"));
                objUsuario.put("NO", ic.rs.getString("NO"));
                objUsuario.put("FI", ic.rs.getString("FI"));
                objUsuario.put("PC", ic.rs.getString("PC"));
                objUsuario.put("PA", ic.rs.getString("PA"));
                objUsuario.put("RE", ic.rs.getString("RE"));
                objUsuario.put("ND", ic.rs.getString("ND"));
                objUsuario.put("NP", ic.rs.getString("NP"));
                objUsuario.put("BZ", ic.rs.getString("BZ"));
                objUsuario.put("NE", ic.rs.getString("NE"));
                objUsuario.put("CN", ic.rs.getString("CN"));
                objUsuario.put("NL", ic.rs.getString("NL"));
                objUsuario.put("NC", ic.rs.getString("NC"));
                objUsuario.put("SD", ic.rs.getString("SD"));
                objUsuario.put("SG", ic.rs.getString("SG"));
                objUsuario.put("contacto", ic.rs.getString("contacto"));
                objUsuario.put("promesado", ic.rs.getString("promesado"));
                objUsuario.put("pagado", ic.rs.getString("pagado"));
                objUsuario.put("suma", ic.rs.getString("suma"));
                objUsuario.put("cuentas", ic.rs.getString("cuentas"));
                objUsuario.put("total_general", ic.rs.getString("total_general"));
                objUsuario.put("color", ic.rs.getString("color"));
                objUsuario.put("dias", ic.rs.getString("dias"));

                usuarios.add(objUsuario);
//                objCuenta.put("id_cuenta", ic.rs.getInt("id_cuenta"));

            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return usuarios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }

    public static String select_reporte_visitas(String territorio) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "CALL azteca_reporte_visitas_territorio();";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray usuarios = new JSONArray();
            while (ic.rs.next()) {
                // 
                JSONObject objUsuario = new JSONObject();
                objUsuario.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                objUsuario.put("gestor", ic.rs.getString("gestor"));
                objUsuario.put("PP", ic.rs.getString("PP"));
                objUsuario.put("CT", ic.rs.getString("CT"));
                objUsuario.put("CLL", ic.rs.getString("CLL"));
                objUsuario.put("SG", ic.rs.getString("SG"));
                objUsuario.put("PI", ic.rs.getString("PI"));
                objUsuario.put("PT", ic.rs.getString("PT"));
                objUsuario.put("NO", ic.rs.getString("NO"));
                objUsuario.put("FI", ic.rs.getString("FI"));
                objUsuario.put("PC", ic.rs.getString("PC"));
                objUsuario.put("PA", ic.rs.getString("PA"));
                objUsuario.put("RE", ic.rs.getString("RE"));
                objUsuario.put("ND", ic.rs.getString("ND"));
                objUsuario.put("NP", ic.rs.getString("NP"));
                objUsuario.put("BZ", ic.rs.getString("BZ"));
                objUsuario.put("NE", ic.rs.getString("NE"));
                objUsuario.put("CN", ic.rs.getString("CN"));
                objUsuario.put("NL", ic.rs.getString("NL"));
                objUsuario.put("NC", ic.rs.getString("NC"));
                objUsuario.put("SD", ic.rs.getString("SD"));
                objUsuario.put("SG", ic.rs.getString("SG"));
                objUsuario.put("suma", ic.rs.getString("suma"));
                objUsuario.put("cuentas", ic.rs.getString("cuentas"));
                objUsuario.put("total_general", ic.rs.getString("total_general"));
                objUsuario.put("color", ic.rs.getString("color"));

                usuarios.add(objUsuario);
//                objCuenta.put("id_cuenta", ic.rs.getInt("id_cuenta"));

            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return usuarios.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }

    public static String reporte_tickets_pagos(String desde, String hasta, String territrio, String etapa) {
        try {

            StartConexion ic = new StartConexion();
            String sql = "select rp.CLIENTE_UNICO,\n"
                    + "rp.ID_TICKET,\n"
                    + "rp.MONTO_TICKET,\n"
                    + "nombre_usuario(rp.ID_GESTOR) as GESTOR,\n"
                    + "nombre_estatus_llamada_azteca(rp.TIPO_PAGO) as TIPO_PAGO,\n"
                    + "rp.FECHA_TICKET,\n"
                    + "b.ETAPA,\n"
                    + "b.TERRITORIO, b.GERENTE\n"
                    + "from azteca_reporte_pagos rp\n"
                    + "left join azteca_base_genenral_original b on b.CLIENTE_UNICO = rp.CLIENTE_UNICO\n"
                    + "where if('" + desde + "' = '0' or '" + hasta + "' = '0', rp.FECHA_TICKET = curdate(), rp.FECHA_TICKET between '" + desde + "' and '" + hasta + "' )\n"
                    + "and if(concat(" + etapa + ") = '0', b.ETAPA like '%%', b.ETAPA in (" + etapa + ") )\n"
                    + "and if(concat(" + territrio + ") = '0', b.TERRITORIO like '%%', b.TERRITORIO in (" + territrio + ") );";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listTicket = new JSONArray();
            // , CLIENTE_UNICO, , , , , , ETAPA, 
            while (ic.rs.next()) {
                JSONObject objticket = new JSONObject();
                objticket.put("CLIENTE_UNICO", ic.rs.getString("CLIENTE_UNICO"));
                objticket.put("ID_TICKET", ic.rs.getString("ID_TICKET"));
                objticket.put("MONTO_TICKET", ic.rs.getString("MONTO_TICKET"));
                objticket.put("GESTOR", ic.rs.getString("GESTOR"));
                objticket.put("TIPO_PAGO", ic.rs.getString("TIPO_PAGO"));
                objticket.put("FECHA_TICKET", ic.rs.getString("FECHA_TICKET"));
                objticket.put("ETAPA", ic.rs.getString("ETAPA"));
                objticket.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                objticket.put("GERENTE", ic.rs.getString("GERENTE"));
                listTicket.add(objticket);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();

            return listTicket.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }

    }

}
