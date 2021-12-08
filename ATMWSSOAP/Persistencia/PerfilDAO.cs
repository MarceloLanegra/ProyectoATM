using ATMWSSOAP.Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ATMWSSOAP.Persistencia
{
    public class PerfilDAO
    {
        private static string CadenaConexion = "Data Source=(local); Initial Catalog=ATMDB;Integrated Security=SSPI";

        public Perfil Crear(Perfil perfilACrear)
        {
            Perfil perfilCreado;
            int id = 0;
            string sql = "INSERT INTO profiles VALUES(@name,@type,@description)";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@id", perfilACrear.Id));
                    comando.Parameters.Add(new SqlParameter("@name", perfilACrear.Name));
                    comando.Parameters.Add(new SqlParameter("@type", perfilACrear.Type));
                    comando.Parameters.Add(new SqlParameter("@description", perfilACrear.Description));
                    comando.ExecuteNonQuery();
                }
                perfilCreado = Obtener(ObtenerIdRegistrado());
                return perfilCreado;
            }
        }
        public int ObtenerIdRegistrado()
        {
            int id = 0;
            string sql = "select max(id) as id from profiles";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    id = Convert.ToInt32(comando.ExecuteScalar());
                }
            }
            return id;
        }
        public Perfil Obtener(int id)
        {
            Perfil perfilEncontrado = null;
            string sql = "SELECT * FROM profiles WHERE id=@id";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@id", id));
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        if (resultado.Read())
                        {
                            perfilEncontrado = new Perfil()
                            {
                                Id = (int)resultado["id"],
                                Name = (string)resultado["name"],
                                Type = (string)resultado["type"],
                                Description = (string)resultado["description"]
                            };
                        }
                    }
                }
                return perfilEncontrado;
            }
        }
        public Perfil Modificar(Perfil perfilAModificar)
        {
            Perfil perfilModificado;
            string sql = "UPDATE profiles SET name = @name, type = @type, description = @description where id = @id";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@id", perfilAModificar.Id));
                    comando.Parameters.Add(new SqlParameter("@name", perfilAModificar.Name));
                    comando.Parameters.Add(new SqlParameter("@type", perfilAModificar.Type));
                    comando.Parameters.Add(new SqlParameter("@description", perfilAModificar.Description));
                    comando.ExecuteNonQuery();
                }
                perfilModificado = Obtener(perfilAModificar.Id);
                return perfilAModificar;
            }
        }
        public void Eliminar(int id)
        {
            string sql = "DELETE FROM profiles WHERE id=@id";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@id", id));
                    comando.ExecuteNonQuery();
                }
            }
        }
        public List<Perfil> Listar()
        {
            List<Perfil> perfilesEncontrados = new List<Perfil>();
            Perfil perfilEncontrado;
            string sql = "SELECT * FROM profiles";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        while (resultado.Read())
                        {
                            perfilEncontrado = new Perfil()
                            {
                                Id = (int)resultado["id"],
                                Name = (string)resultado["name"],
                                Type = (string)resultado["type"],
                                Description = (string)resultado["description"]
                            };
                            perfilesEncontrados.Add(perfilEncontrado);
                        }
                    }
                }
            }
            return perfilesEncontrados;
        }
    }
}