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
		[StringLength(8)]
        public string matricule { get; set; }
<<<<<<< HEAD
		[RegularExpression("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,18}$")]
=======
        [Display(Name = "Mot de passe")]
        [DataType(DataType.Password)]
>>>>>>> Nico
        public string mdp { get; set; }
        [Display(Name = "Nom")]
		[Required]
		[MinLength(1)]
		[MaxLength(30)]
		public string nom { get; set; }
        [Display(Name = "Prénom")]
		[Required]
		[MinLength(1)]
		[MaxLength(30)]
		public string prenom { get; set; }
        [Display(Name = "Date de naissance")]
		[Required]
		public System.DateTime dateNaissance { get; set; }
        [Display(Name = "Adresse")]
		[Required]
		[MinLength(1)]
		[MaxLength(50)]
		public string adresse { get; set; }
        [Display(Name = "Téléphone")]
<<<<<<< HEAD
		[Required]
		[MinLength(1)]
		[StringLength(12)]
		[RegularExpression("\\(?\\d{3}\\)?-? *\\d{3}-? *-?\\d{4}")]
		public string telResidentiel { get; set; }
        [Display(Name = "Pste téléphonique")]
		[Required]
		[MinLength(1)]
		[StringLength(3)]
		public string posteTel { get; set; }
=======
        public string telResidentiel { get; set; }
        [Display(Name = "Poste téléphonique")]
        public string posteTel { get; set; }
>>>>>>> Nico
        [Display(Name = "Emploi")]
        public int categorieEmploi { get; set; }
        public string tag { get; set; }
    
        public virtual CategorieEmploi CategorieEmploi1 { get; set; }
    }
}
