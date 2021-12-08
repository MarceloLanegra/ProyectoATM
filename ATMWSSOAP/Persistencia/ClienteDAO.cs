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
            Cliente clienteEncontrado = null;
            string sql = "SELECT * FROM location_owners WHERE ruc=@ruc";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@ruc", ruc));
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        if (resultado.Read())
                        {
                            clienteEncontrado = new Cliente()
                            {
                                Nombre = (string)resultado["name"],
                                Empresa = (string)resultado["business_name"],
                                Ruc = (string)resultado["ruc"],
                            };
                        }
                    }
                }
                return clienteEncontrado;
            }
        }

        public Cliente Modificar(Cliente clienteAModificar)
        {
            Cliente clienteModificado;
            string sql = "UPDATE location_owners SET name=@name,business_name=@business_name,ruc=@ruc WHERE ruc=@ruc";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@name", clienteAModificar.Nombre));
                    comando.Parameters.Add(new SqlParameter("@name_business", clienteAModificar.Empresa));
                    comando.Parameters.Add(new SqlParameter("@ruc", clienteAModificar.Ruc));
                    comando.ExecuteNonQuery();
                }
                clienteModificado = Obtener(clienteAModificar.Codigoalumno);
                return clienteModificado;
            }
        }
    }
}