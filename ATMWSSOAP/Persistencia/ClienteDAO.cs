using ATMWSSOAP.Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ATMWSSOAP.Persistencia
{
    public class ClienteDAO
    {
        private string CadenaConexion = "Data Source=(local); Initial Catalog=ATMDB;Integrated Security=SSPI;";

        public Cliente Crear(Cliente clienteACrear)
        {
            Cliente clienteCreado;
            string sql = "INSERT INTO location_owners VALUES(@name,@business_name,@ruc)";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@name", clienteACrear.Nombre));
                    comando.Parameters.Add(new SqlParameter("@business_name", clienteACrear.Empresa));
                    comando.Parameters.Add(new SqlParameter("@ruc", clienteACrear.Ruc));
                    comando.ExecuteNonQuery();
                }
                clienteCreado = Obtener(clienteACrear.Nombre);
                return clienteCreado;
            }
        }

        public Cliente Obtener(string ruc)
        {

        }
    }
}