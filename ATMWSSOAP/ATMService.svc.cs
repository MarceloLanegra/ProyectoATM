using ATMWSSOAP.Dominio;
using ATMWSSOAP.Errores;
using ATMWSSOAP.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace ATMWSSOAP
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "ATMService" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione ATMService.svc o ATMService.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class ATMService : IATMService
    {
        private UsuarioDAO usuarioDao = new UsuarioDAO();
        private PerfilDAO perfilDao = new PerfilDAO();

        public Perfil CrearPerfil(Perfil perfilACrear)
        {
            if (perfilDao.Obtener(perfilACrear.Id) != null)
            {
                throw new FaultException<ErroresException>(new ErroresException()
                {
                    Codigo = "101",
                    Descripcion = "El alumno YA EXISTE"
                },
                new FaultReason("Error al intentar creación"));
            }
            return perfilDao.Crear(perfilACrear);
        }

        public Usuario CrearUsuario(Usuario usuarioACrear)
        {
            if (usuarioDao.Obtener(usuarioACrear.Code) != null)
            {
                throw new FaultException<ErroresException>(new ErroresException()
                {
                    Codigo = "101",
                    Descripcion = "El alumno YA EXISTE"
                },
                new FaultReason("Error al intentar creación"));
            }
            return usuarioDao.Crear(usuarioACrear);
        }

        public void EliminarPerfil(int id)
        {
            perfilDao.Eliminar(id);
        }

        public void EliminarUsuario(int id)
        {
            usuarioDao.Eliminar(id);
        }

        public List<Perfil> ListarPerfiles()
        {
            return perfilDao.Listar();
        }

        public List<Usuario> ListarUsuarios()
        {
            return usuarioDao.Listar();
        }

        public Perfil ModificarPerfil(Perfil perfilAModificar)
        {
            return perfilDao.Modificar(perfilAModificar);
        }

        public Usuario ModificarUsuario(Usuario usuarioAModificar)
        {
            return usuarioDao.Modificar(usuarioAModificar);
        }

        public Perfil ObtenerPerfil(int id)
        {
            return perfilDao.Obtener(id);
        }

        public Usuario ObtenerUsuario(string code)
        {
            return usuarioDao.Obtener(code);
        }
    }
}
