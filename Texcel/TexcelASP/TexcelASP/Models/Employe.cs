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
    using System.ComponentModel.DataAnnotations;

    public partial class Employe
    {
        [Display(Name = "Matricule")]
        public string matricule { get; set; }
        public string mdp { get; set; }
        [Display(Name = "Nom")]
        public string nom { get; set; }
        [Display(Name = "Prénom")]
        public string prenom { get; set; }
        [Display(Name = "Date de naissance")]
        public System.DateTime dateNaissance { get; set; }
        [Display(Name = "Adresse")]
        public string adresse { get; set; }
        [Display(Name = "Téléphone")]
        public string telResidentiel { get; set; }
        [Display(Name = "Pste téléphonique")]
        public string posteTel { get; set; }
        [Display(Name = "Emploi")]
        public int categorieEmploi { get; set; }
        public string tag { get; set; }
    
        public virtual CategorieEmploi CategorieEmploi1 { get; set; }
    }
}
