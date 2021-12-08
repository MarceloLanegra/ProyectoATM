using ATMWSSOAP.Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ATMWSSOAP.Persistencia
{
    public class UsuarioDAO
    {
        private static string CadenaConexion = "Data Source=(local); Initial Catalog=ATMDB;Integrated Security=SSPI";
        public Usuario Crear(Usuario usuarioACrear)
        {
            Usuario usuarioCreado;
            string sql = "INSERT INTO users VALUES(@code,@name,@last_name,@email,@description,@admin,@update_at,@encryted_password,@reset_password_token,@reset_password_sent_at,@remember_created_at,@profiles_id)";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@code", usuarioACrear.Code));
                    comando.Parameters.Add(new SqlParameter("@name", usuarioACrear.Name));
                    comando.Parameters.Add(new SqlParameter("@last_name", usuarioACrear.LastName));
                    comando.Parameters.Add(new SqlParameter("@email", usuarioACrear.Email));
                    comando.Parameters.Add(new SqlParameter("@description", usuarioACrear.Description));
                    comando.Parameters.Add(new SqlParameter("@admin", usuarioACrear.Admin));
                    comando.Parameters.Add(new SqlParameter("@update_at", usuarioACrear.UpdateAt));
                    comando.Parameters.Add(new SqlParameter("@encryted_password", usuarioACrear.EncrytedPassword));
                    comando.Parameters.Add(new SqlParameter("@reset_password_token", usuarioACrear.ResetPasswordToken));
                    comando.Parameters.Add(new SqlParameter("@reset_password_sent_at", usuarioACrear.ResetPasswordSentAt));
                    comando.Parameters.Add(new SqlParameter("@remember_created_at", usuarioACrear.RememberCreatedAt));
                    comando.Parameters.Add(new SqlParameter("@profiles_id", usuarioACrear.ProfilesId));
                    comando.ExecuteNonQuery();
                }
                usuarioCreado = Obtener(usuarioACrear.Code);
                return usuarioCreado;
            }
        }
        public Usuario Obtener(string code)
        {
            Usuario usuarioEncontrado = null;
            string sql = "SELECT * FROM users WHERE code=@code";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@code", code));
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        if (resultado.Read())
                        {
                            usuarioEncontrado = new Usuario()
                            {
                                Id = (int)resultado["id"],
                                Code = (string)resultado["code"],
                                Name = (string)resultado["name"],
                                LastName = (string)resultado["last_name"],
                                Email = (string)resultado["email"],
                                Description = (string)resultado["description"],
                                Admin = (int)resultado["admin"],
                                UpdateAt = (DateTime?)resultado["update_at"],
                                EncrytedPassword = (string)resultado["encrypted_password"],
                                ResetPasswordToken = (string)resultado["reset_password_token"],
                                ResetPasswordSentAt = (string)resultado["reset_password_sent_at"],
                                RememberCreatedAt = (string)resultado["remember_created_at"],
                                ProfilesId = (int)resultado["profiles_id"],
                            };
                        }
                    }
                }
                return usuarioEncontrado;
            }
        }
        public Usuario Modificar(Usuario usuarioAModificar)
        {
            Usuario usuarioModificado;
            string sql = "UPDATE users SET code = @code, name = @name, last_name = @last_name, email = @email, description = @description, admin = @admin,update_at = @update_at, encrypted_password = @encrypted_password, reset_password_token = @reset_password_token, reset_password_sent_at = @reset_password_sent_at,remember_created_at = @remember_created_at, profiles_id = @profiles_id where id = @id";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.Add(new SqlParameter("@id", usuarioAModificar.Id));
                    comando.Parameters.Add(new SqlParameter("@code", usuarioAModificar.Code));
                    comando.Parameters.Add(new SqlParameter("@name", usuarioAModificar.Name));
                    comando.Parameters.Add(new SqlParameter("@last_name", usuarioAModificar.LastName));
                    comando.Parameters.Add(new SqlParameter("@email", usuarioAModificar.Email));
                    comando.Parameters.Add(new SqlParameter("@description", usuarioAModificar.Description));
                    comando.Parameters.Add(new SqlParameter("@admin", usuarioAModificar.Admin));
                    comando.Parameters.Add(new SqlParameter("@update_at", usuarioAModificar.UpdateAt));
                    comando.Parameters.Add(new SqlParameter("@encrypted_password", usuarioAModificar.EncrytedPassword));
                    comando.Parameters.Add(new SqlParameter("@reset_password_token", usuarioAModificar.ResetPasswordToken));
                    comando.Parameters.Add(new SqlParameter("@reset_password_sent_at", usuarioAModificar.ResetPasswordSentAt));
                    comando.Parameters.Add(new SqlParameter("@remember_created_at", usuarioAModificar.RememberCreatedAt));
                    comando.Parameters.Add(new SqlParameter("@profiles_id", usuarioAModificar.ProfilesId));
                    comando.ExecuteNonQuery();
                }
                usuarioModificado = Obtener(usuarioAModificar.Code);
                return usuarioModificado;
            }
        }
        public void Eliminar(int id)
        {
            string sql = "DELETE FROM users WHERE id=@id";
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
        public List<Usuario> Listar()
        {
            List<Usuario> usuariosEncontrados = new List<Usuario>();
            Usuario usuarioEncontrado;
            string sql = "SELECT * FROM users";
            using (SqlConnection conexion = new SqlConnection(CadenaConexion))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand(sql, conexion))
                {
                    using (SqlDataReader resultado = comando.ExecuteReader())
                    {
                        while (resultado.Read())
                        {
                            usuarioEncontrado = new Usuario()
                            {
                              Id = (int)resultado["id"],
                                Code = (string)resultado["code"],
                                Name = (string)resultado["name"],
                                LastName = (string)resultado["last_name"],
                                Email = (string)resultado["email"],
                                Description = (string)resultado["description"],
                                Admin = (int)resultado["admin"],
                                UpdateAt = (DateTime?)resultado["update_at"],
                                EncrytedPassword = (string)resultado["encrypted_password"],
                                ResetPasswordToken = (string)resultado["reset_password_token"],
                                ResetPasswordSentAt = (string)resultado["reset_password_sent_at"],
                                RememberCreatedAt = (string)resultado["remember_created_at"],
                                ProfilesId = (int)resultado["profiles_id"]
                            };
                            usuariosEncontrados.Add(usuarioEncontrado);
                        }
                    }
                }
            }
            return usuariosEncontrados;
        }
    }
}