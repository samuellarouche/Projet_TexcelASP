//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TexcelASP.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employe
    {
        public string matricule { get; set; }
        public string mdp { get; set; }
        public string nom { get; set; }
        public string prenom { get; set; }
        public System.DateTime dateNaissance { get; set; }
        public string adresse { get; set; }
        public string telResidentiel { get; set; }
        public string posteTel { get; set; }
        public int categorieEmploi { get; set; }
    
        public virtual CategorieEmploi CategorieEmploi1 { get; set; }
    }
}
