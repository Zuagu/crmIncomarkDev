/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.model;

import java.sql.SQLException;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

/**
 *
 * @author zuagu
 */
public class ModelVacantes {

    //==========================================================================
    public static String azteca_select_requerimetos_campo(String territorio, String etapa) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT TERRITORIO, LOCALIDAD_V, count(CLIENTE_UNICO) as CANTIDAD, sum(SALDO) as SALDO_TOTAL,\n"
                    + "sum(RESULTADO_V='N/A') as RESULTADO_NA,\n"
                    + "sum(if(RESULTADO_V='N/A',SALDO,0)) as val_RESULTADO_NA,\n"
                    + "sum(RESULTADO_V='AP-Aviso debajo de la puerta') as RESULTADO_AP,\n"
                    + "sum(if(RESULTADO_V='AP-Aviso debajo de la puerta',SALDO,0)) as val_RESULTADO_AP,\n"
                    + "sum(RESULTADO_V='NM-No concreta en este momento') + sum(RESULTADO_V='PP-PROMESA DE PAGO') + \n"
                    + "sum(RESULTADO_V='PP-Promete devolver el producto') + sum(RESULTADO_V='PP-Promete liquidar en plazos') + \n"
                    + "sum(RESULTADO_V='PP-Promete liquidar en un solo pago') + sum(RESULTADO_V='RF-Recado con familiar') + \n"
                    + "sum(RESULTADO_V='Se recomienda volver a verificar') + sum(RESULTADO_V='MT-Mensaje con terceros') + \n"
                    + "sum(RESULTADO_V='CI-CLIENTE NO DEFINE') + sum(RESULTADO_V='AD-ACUDIRA AL DESPACHO') + sum(RESULTADO_V='SE NECESITARA UN CERRADOR')\n"
                    + "as RESULTADO_CCERRADOR,\n"
                    + "sum(if(RESULTADO_V='NM-No concreta en este momento',SALDO,\n"
                    + "		if(RESULTADO_V='PP-PROMESA DE PAGO',SALDO,\n"
                    + "			if(RESULTADO_V='PP-Promete devolver el producto',SALDO,\n"
                    + "				if(RESULTADO_V='PP-Promete liquidar en plazos',SALDO,\n"
                    + "					if(RESULTADO_V='PP-Promete liquidar en un solo pago',SALDO,\n"
                    + "						if(RESULTADO_V='RF-Recado con familiar',SALDO,\n"
                    + "							if(RESULTADO_V='Se recomienda volver a verificar',SALDO,\n"
                    + "								if(RESULTADO_V='MT-Mensaje con terceros',SALDO,\n"
                    + "									if(RESULTADO_V='CI-CLIENTE NO DEFINE',SALDO,\n"
                    + "										if(RESULTADO_V='AD-ACUDIRA AL DESPACHO',SALDO,\n"
                    + "											if(RESULTADO_V='SE NECESITARA UN CERRADOR',SALDO,0)\n"
                    + "											)\n"
                    + "										)\n"
                    + "									)\n"
                    + "								)\n"
                    + "							)\n"
                    + "						)\n"
                    + "					)\n"
                    + "				)\n"
                    + "			)\n"
                    + "		)\n"
                    + ") as val_RESULTADO_CCERRADOR,\n"
                    + "FORMAT( sum(RESULTADO_V='N/A') / 1500, 0) as CARTEROS,\n"
                    + "-- sum(RESULTADO_V='N/A') / 1500 as CARTEROS,\n"
                    + "FORMAT( sum(RESULTADO_V='AP-Aviso debajo de la puerta') / 1500, 0) AS NOTIFICADOR,\n"
                    + "FORMAT( (sum(RESULTADO_V='NM-No concreta en este momento') + sum(RESULTADO_V='PP-PROMESA DE PAGO') + \n"
                    + "sum(RESULTADO_V='PP-Promete devolver el producto') + sum(RESULTADO_V='PP-Promete liquidar en plazos') + \n"
                    + "sum(RESULTADO_V='PP-Promete liquidar en un solo pago') + sum(RESULTADO_V='RF-Recado con familiar') + \n"
                    + "sum(RESULTADO_V='Se recomienda volver a verificar') + sum(RESULTADO_V='MT-Mensaje con terceros') + \n"
                    + "sum(RESULTADO_V='CI-CLIENTE NO DEFINE21') + sum(RESULTADO_V='AD-ACUDIRA AL DESPACHO') + sum(RESULTADO_V='SE NECESITARA UN CERRADOR') ) / 1500, 0) AS CERRADOR\n"
                    + "from azteca_base_genenral_original\n"
                    + "where IDENTIFICADOR != 0\n"
                    + "and if( concat(" + territorio + ") = '0', TERRITORIO like '%%' , TERRITORIO in (" + territorio + ") ) \n"
                    + "and if( concat(" + etapa + ") = '0', ETAPA like '%%' , ETAPA in (" + etapa + ") ) \n"
                    + "group by LOCALIDAD_V\n"
                    + "having cantidad > 500\n"
                    + "order by cantidad desc,CARTEROS,NOTIFICADOR,CERRADOR;";
            System.out.println(sql);

            ic.rs = ic.st.executeQuery(sql);

            JSONArray vacantes = new JSONArray();
            // TERRITORIO, LOCALIDAD_V, CANTIDAD, SALDO_TOTAL, RESULTADO_NA, RESULTADO_AP, RESULTADO_CCERRADOR, CARTEROS, NOTIFICADOR, CERRADOR
            while (ic.rs.next()) {
                JSONObject newObj = new JSONObject();
                newObj.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                newObj.put("LOCALIDAD_V", ic.rs.getString("LOCALIDAD_V"));
                newObj.put("CANTIDAD", ic.rs.getString("CANTIDAD"));
                newObj.put("SALDO_TOTAL", ic.rs.getString("SALDO_TOTAL"));
                newObj.put("RESULTADO_NA", ic.rs.getString("RESULTADO_NA"));
                newObj.put("val_RESULTADO_NA", ic.rs.getString("val_RESULTADO_NA"));
                newObj.put("RESULTADO_AP", ic.rs.getString("RESULTADO_AP"));
                newObj.put("val_RESULTADO_AP", ic.rs.getString("val_RESULTADO_AP"));
                newObj.put("RESULTADO_CCERRADOR", ic.rs.getString("RESULTADO_CCERRADOR"));
                newObj.put("val_RESULTADO_CCERRADOR", ic.rs.getString("val_RESULTADO_CCERRADOR"));
                newObj.put("CARTEROS", ic.rs.getString("CARTEROS"));
                newObj.put("NOTIFICADOR", ic.rs.getString("NOTIFICADOR"));
                newObj.put("CERRADOR", ic.rs.getString("CERRADOR"));
                vacantes.add(newObj);

            }
            ic.conn.close();
            ic.rs.close();
            ic.st.close();
            return vacantes.toJSONString();
        } catch (SQLException ex) {
            System.out.println(ex);
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + ex;
        }
    }

    public static String azteca_select_requerimetos_campo_rh(String territorio, String etapa) {
        try {
            StartConexion ic = new StartConexion();
            String sql = "SELECT \n"
                    + "  TERRITORIO,ESTADO_V,\n"
                    + "  LOCALIDAD_V, \n"
                    + "  sum(RESULTADO_V in ('N/A', '#N/D')) as RESULTADO_NA,\n"
                    + "  sum(RESULTADO_V='AP-Aviso debajo de la puerta') as RESULTADO_AP,\n"
                    + "  sum(RESULTADO_V='NM-No concreta en este momento') + sum(RESULTADO_V='PP-PROMESA DE PAGO') + \n"
                    + "  sum(RESULTADO_V='PP-Promete devolver el producto') + sum(RESULTADO_V='PP-Promete liquidar en plazos') + \n"
                    + "  sum(RESULTADO_V='PP-Promete liquidar en un solo pago') + sum(RESULTADO_V='RF-Recado con familiar') + \n"
                    + "  sum(RESULTADO_V='Se recomienda volver a verificar') + sum(RESULTADO_V='MT-Mensaje con terceros') + \n"
                    + "  sum(RESULTADO_V='CI-CLIENTE NO DEFINE') + sum(RESULTADO_V='AD-ACUDIRA AL DESPACHO') + sum(RESULTADO_V='SE NECESITARA UN CERRADOR') as RESULTADO_CCERRADOR,\n"
                    + "    \n"
                    + "  FORMAT( sum(RESULTADO_V='N/A') / 1500, 0) as CARTEROS,\n"
                    + "  FORMAT( sum(RESULTADO_V='AP-Aviso debajo de la puerta') / 1500, 0) AS NOTIFICADOR,\n"
                    + "  FORMAT( (sum(RESULTADO_V='NM-No concreta en este momento') + sum(RESULTADO_V='PP-PROMESA DE PAGO') + \n"
                    + "  sum(RESULTADO_V='PP-Promete devolver el producto') + sum(RESULTADO_V='PP-Promete liquidar en plazos') + \n"
                    + "  sum(RESULTADO_V='PP-Promete liquidar en un solo pago') + sum(RESULTADO_V='RF-Recado con familiar') + \n"
                    + "  sum(RESULTADO_V='Se recomienda volver a verificar') + sum(RESULTADO_V='MT-Mensaje con terceros') + \n"
                    + "  sum(RESULTADO_V='CI-CLIENTE NO DEFINE21') + sum(RESULTADO_V='AD-ACUDIRA AL DESPACHO') + sum(RESULTADO_V='SE NECESITARA UN CERRADOR') ) / 1500, 0) AS CERRADOR,\n"
                    + "    FORMAT( FORMAT(sum(RESULTADO_V='N/A') / 1500 ,0) + FORMAT( sum(RESULTADO_V='AP-Aviso debajo de la puerta') / 1500 ,0) +\n"
                    + "    ((sum(RESULTADO_V='NM-No concreta en este momento') + sum(RESULTADO_V='PP-PROMESA DE PAGO') + \n"
                    + "  sum(RESULTADO_V='PP-Promete devolver el producto') + sum(RESULTADO_V='PP-Promete liquidar en plazos') + \n"
                    + "  sum(RESULTADO_V='PP-Promete liquidar en un solo pago') + sum(RESULTADO_V='RF-Recado con familiar') + \n"
                    + "  sum(RESULTADO_V='Se recomienda volver a verificar') + sum(RESULTADO_V='MT-Mensaje con terceros') + \n"
                    + "  sum(RESULTADO_V='CI-CLIENTE NO DEFINE21') + sum(RESULTADO_V='AD-ACUDIRA AL DESPACHO') + sum(RESULTADO_V='SE NECESITARA UN CERRADOR') ) / 1500),0) AS SUMA\n"
                    + "from azteca_base_genenral_original \n"
                    + "where IDENTIFICADOR != 0 "
                    + "and if( concat(" + territorio + ") = '0', TERRITORIO like '%%' , TERRITORIO in (" + territorio + ") ) \n"
                    + "and if( concat(" + etapa + ") = '0', ETAPA like '%%' , ETAPA in (" + etapa + ") ) \n"
                    + "group by LOCALIDAD_V  having SUMA > 0 order by ESTADO_V;",
                    sql2 = "SELECT \n"
                    + "localidad, \n"
                    + "sum(if( id_puesto = 12, 1,0)) as Cerrador,\n"
                    + "sum(if( id_puesto = 13, 1,0)) as Notificador,\n"
                    + "sum(if( id_puesto = 14, 1,0)) as Cartero,\n"
                    + "sum(if( id_puesto = 12 or id_puesto = 13 or id_puesto = 14, 1,0)) as suma\n"
                    + "from arcade_usuarios where id_puesto in (12,13,14) and f_active = 1 \n"
                    + "group by localidad\n"
                    + "having not localidad is null;";
            System.out.println(sql);
            System.out.println(sql2);

            ic.rs = ic.st.executeQuery(sql);

            JSONArray vacantes = new JSONArray();
            // TERRITORIO, LOCALIDAD_V, RESULTADO_NA, RESULTADO_AP, RESULTADO_CCERRADOR, CARTEROS, NOTIFICADOR, CERRADOR, SUMA
            while (ic.rs.next()) {
                JSONObject newObj = new JSONObject();
                newObj.put("TERRITORIO", ic.rs.getString("TERRITORIO"));
                newObj.put("LOCALIDAD_V", ic.rs.getString("LOCALIDAD_V"));
                newObj.put("ESTADO_V", ic.rs.getString("ESTADO_V"));
                newObj.put("CARTEROS", ic.rs.getString("CARTEROS"));
                newObj.put("NOTIFICADOR", ic.rs.getString("NOTIFICADOR"));
                newObj.put("CERRADOR", ic.rs.getString("CERRADOR"));
                newObj.put("SUMA", ic.rs.getString("SUMA"));
                vacantes.add(newObj);

            }
            ic.rs = ic.st.executeQuery(sql2);

            JSONArray ocupados = new JSONArray();
            // localidad, Notificador, Cartero, Cerrador, suma
            while (ic.rs.next()) {
                JSONObject objocupados = new JSONObject();
                objocupados.put("localidad", ic.rs.getString("localidad"));
                objocupados.put("Notificador", ic.rs.getString("Notificador"));
                objocupados.put("Cartero", ic.rs.getString("Cartero"));
                objocupados.put("Cerrador", ic.rs.getString("Cerrador"));
                objocupados.put("suma", ic.rs.getString("suma"));
                ocupados.add(objocupados);

            }
            JSONArray res = new JSONArray();
            res.add(vacantes);
            res.add(ocupados);

            ic.conn.close();
            ic.rs.close();
            ic.st.close();
            return res.toJSONString();
        } catch (SQLException ex) {
            System.out.println(ex);
            return "SQL: Error al traer los datos de la cuenta azteca Code Error: " + ex;
        }
    }
}
