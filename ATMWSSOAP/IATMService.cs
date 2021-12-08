using ATMWSSOAP.Dominio;
using ATMWSSOAP.Errores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace ATMWSSOAP
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IATMService" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IATMService
    {
        [FaultContract(typeof(ErroresException))]
        [OperationContract]
        Usuario CrearUsuario(Usuario usuarioACrear);
        [OperationContract]
        Usuario ObtenerUsuario(string codigo);
        [OperationContract]
        Usuario ModificarUsuario(Usuario usuarioAModificar);
        [OperationContract]
        void EliminarUsuario(int id);
        [OperationContract]
        List<Usuario> ListarUsuarios();



        [FaultContract(typeof(ErroresException))]
        [OperationContract]
        Perfil CrearPerfil(Perfil perfilACrear);
        [OperationContract]
        Perfil ObtenerPerfil(int id);
        [OperationContract]
        Perfil ModificarPerfil(Perfil perfilAModificar);
        [OperationContract]
        void EliminarPerfil(int id);
        [OperationContract]
        List<Perfil> ListarPerfiles();
    }
}

