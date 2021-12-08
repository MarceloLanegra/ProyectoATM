using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace ATMWSSOAP.Dominio
{
    [DataContract]
    public class Cliente
    {
        [DataMember]
        public string Nombre { get; set; }
        [DataMember]
        public string Empresa { get; set; }
        [DataMember]
        public string Ruc { get; set; }
    }
}