using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace ATMWSSOAP.Dominio
{
    [DataContract]
    public class Usuario
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Code { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string LastName { get; set; }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public string Description { get; set; }
        [DataMember]
        public int Admin { get; set; }
        [DataMember]
        public DateTime? UpdateAt { get; set; }
        [DataMember]
        public string EncrytedPassword { get; set; }
        [DataMember]
        public string ResetPasswordToken { get; set; }
        [DataMember]
        public string ResetPasswordSentAt { get; set; }
        [DataMember]
        public string RememberCreatedAt { get; set; }
        [DataMember]
        public int ProfilesId { get; set; }
    }
}