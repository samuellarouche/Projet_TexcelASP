//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------
using System.ComponentModel.DataAnnotations;

namespace TexcelASP.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Equipe
    {
        public int id { get; set; }
		[Display(Name = "Chef d'équipe")]
        public int chefEquipe { get; set; }
    }
}
