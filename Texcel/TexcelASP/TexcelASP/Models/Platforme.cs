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
    
    public partial class Platforme
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Platforme()
        {
            this.Jeu = new HashSet<Jeu>();
        }
    
        public int id { get; set; }
		[Required]
		[MinLength(1)]
		[MaxLength(30)]
        [Display(Name = "Plateforme")]
		public string nom { get; set; }
		[Required]
		[MinLength(1)]
		[MaxLength(200)]
		[Display(Name = "Configuration")]
		public string configuration { get; set; }
		[Required]
        [Display(Name = "Type plateforme")]
		public int typePlatforme { get; set; }
		[Required]
        [Display(Name = "OS")]
		public string systemeExploitation { get; set; }
        public string tag { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Jeu> Jeu { get; set; }
        public virtual SystemeExploitation SystemeExploitation1 { get; set; }
        public virtual TypePlatforme TypePlatforme1 { get; set; }
    }
}
