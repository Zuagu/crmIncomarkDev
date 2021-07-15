/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.model;

import java.sql.SQLException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author zuagu
 */
public class ModelSucursal {

    public static String select_sucursales() {
        try {

            StartConexion ic = new StartConexion();
            String sql = "select * from arcade_sucursales where f_deleted = 0";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listSucrusales = new JSONArray();
            // GESTOR, CUENTA, NOMBRE, GERENTE, ESTATUS_LLAMADA, CONVENIO, PAGOS, FECHA, ESTATUS_PAGO, FECHA_PAGO
            while (ic.rs.next()) {
                JSONObject objSucursal = new JSONObject();
                objSucursal.put("id_sucursal", ic.rs.getString("id_sucursal"));
                objSucursal.put("sucursal", ic.rs.getString("sucursal"));
                objSucursal.put("f_deleted", ic.rs.getString("f_deleted"));
                listSucrusales.add(objSucursal);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();
            return listSucrusales.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String deleted_sucursales(String id_sucursal) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "update arcade_sucursales set f_deleted = 1 where id_sucursal = '" + id_sucursal + "';";
            System.out.println(sql);
            ic.st.executeUpdate(sql);
            JSONObject objSucursal = new JSONObject();
            objSucursal.put("message", "Sucursal eliminado");
            ic.st.close();
            ic.conn.close();
            return objSucursal.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al eliminar azteca Code Error: " + e;
        }
    }

    public static String agregar_sucursal(String nombre_sucursal) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "insert into arcade_sucursales(sucursal, f_deleted) values('" + nombre_sucursal + "',0);";
            System.out.println(sql);
            ic.st.executeUpdate(sql);
            JSONObject objSucursal = new JSONObject();
            objSucursal.put("message", "Sucursal Agregado");
            ic.st.close();
            ic.conn.close();
            return objSucursal.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al insertar azteca Code Error: " + e;
        }
    }
//    departamentos

    public static String select_departamentos() {
        try {

            StartConexion ic = new StartConexion();
            String sql = "select * from sic_departamentos where f_deleted = 0;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listDepartamentos = new JSONArray();
            // id_departamento, departamento
            while (ic.rs.next()) {
                JSONObject objDepartamento = new JSONObject();
                objDepartamento.put("id_departamento", ic.rs.getString("id_departamento"));
                objDepartamento.put("departamento", ic.rs.getString("departamento"));
                objDepartamento.put("f_deleted", ic.rs.getString("f_deleted"));
                listDepartamentos.add(objDepartamento);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();
            return listDepartamentos.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String delete_departamento(String id_departamento) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "update sic_departamentos set f_deleted = 1 where id_departamento = '" + id_departamento + "';";
            System.out.println(sql);
            ic.st.executeUpdate(sql);
            JSONObject objSucursal = new JSONObject();
            objSucursal.put("message", "Departamentos eliminado");
            ic.st.close();
            ic.conn.close();
            return objSucursal.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al eliminar azteca Code Error: " + e;
        }
    }

    public static String agregar_departamento(String nombre_departamento) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "insert into sic_departamentos(departamento, f_deleted) values('" + nombre_departamento + "',0);";
            System.out.println(sql);
            ic.st.executeUpdate(sql);
            JSONObject objSucursal = new JSONObject();
            objSucursal.put("message", "Departamento Agregado");
            ic.st.close();
            ic.conn.close();
            return objSucursal.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al insertar azteca Code Error: " + e;
        }
    }
//    departamentos    

    public static String select_areas() {
        try {

            StartConexion ic = new StartConexion();
            String sql = "select * from sic_areas where f_deleted = 0;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listAreas = new JSONArray();
            // id_area, area, f_deleted
            while (ic.rs.next()) {
                JSONObject objArea = new JSONObject();
                objArea.put("id_area", ic.rs.getString("id_area"));
                objArea.put("area", ic.rs.getString("area"));
                objArea.put("f_deleted", ic.rs.getString("f_deleted"));
                listAreas.add(objArea);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();
            return listAreas.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }

    public static String delete_area(String id_area) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "update sic_areas set f_deleted = 1 where id_area = '" + id_area + "';";
            System.out.println(sql);
            ic.st.executeUpdate(sql);
            JSONObject objSucursal = new JSONObject();
            objSucursal.put("message", "Area eliminada");
            ic.st.close();
            ic.conn.close();
            return objSucursal.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al eliminar azteca Code Error: " + e;
        }
    }
    public static String agregar_area(String nombre_area) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "insert into sic_areas(area, f_deleted) values('" + nombre_area + "',0);";
            System.out.println(sql);
            ic.st.executeUpdate(sql);
            JSONObject objSucursal = new JSONObject();
            objSucursal.put("message", "Area Agregada");
            ic.st.close();
            ic.conn.close();
            return objSucursal.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al insertar azteca Code Error: " + e;
        }
    }
    //    Puestos   

    public static String select_puestos() {
        try {

            StartConexion ic = new StartConexion();
            String sql = "select * from sic_puestos;";
            System.out.println(sql);
            ic.rs = ic.st.executeQuery(sql);
            JSONArray listPuestos = new JSONArray();
            // id_area, area, f_deleted
            while (ic.rs.next()) {
                JSONObject objPuesto = new JSONObject();
                objPuesto.put("id_puesto", ic.rs.getString("id_puesto"));
                objPuesto.put("puesto", ic.rs.getString("puesto"));
                listPuestos.add(objPuesto);
            }
            ic.rs.close();
            ic.st.close();
            ic.conn.close();
            return listPuestos.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + e;
        }
    }
    
    public static String agregar_puesto(String nombre_puesto) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "insert into sic_puestos(puesto) values('" + nombre_puesto + "');";
            System.out.println(sql);
            ic.st.executeUpdate(sql);
            JSONObject objSucursal = new JSONObject();
            objSucursal.put("message", "Puesto Agregado");
            ic.st.close();
            ic.conn.close();
            return objSucursal.toJSONString();
        } catch (SQLException e) {
            return "SQL: Error al insertar azteca Code Error: " + e;
        }
    }

}
