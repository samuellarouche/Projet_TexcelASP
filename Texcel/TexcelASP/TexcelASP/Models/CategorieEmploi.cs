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
<<<<<<< HEAD
	using System.ComponentModel.DataAnnotations;

	public partial class CategorieEmploi
=======
    using System.ComponentModel.DataAnnotations;
    
    public partial class CategorieEmploi
>>>>>>> Nico
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CategorieEmploi()
        {
            this.Employe = new HashSet<Employe>();
        }
    
        public int id { get; set; }
<<<<<<< HEAD
		[Display(Name = "Emploie")]
=======
        [Display(Name = "Type d'emploi")]
>>>>>>> Nico
        public string nom { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Employe> Employe { get; set; }
    }
}
