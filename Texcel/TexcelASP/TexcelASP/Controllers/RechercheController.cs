using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TexcelASP.Models;
namespace TexcelASP.Controllers
{
    public class RechercheController : Controller
    {
		private TexcelASP_SamNicEntities db = new TexcelASP_SamNicEntities();

		// GET: Recherche
		public ActionResult Index(string Rechercher = "")
        {
			var tblJeux = db.Jeu;
			var SelectedJeu = from jeu in tblJeux.Include(t => t.Classification1).Include(t => t.Developpeur1).Include(t => t.Genre1).Include(t => t.Theme1).Include(t => t.Platforme1)
							  where jeu.tag.Contains(Rechercher)
							  select jeu;
			ViewBag.Jeu = SelectedJeu.ToList();


			var tblClassification = db.Classification;
			var SelectedClassification = from Classification in tblClassification
										 where Classification.nom.Contains(Rechercher)
										 select Classification;
			ViewBag.Classification = SelectedClassification.ToList();


			var tblGenre = db.Genre;
			var SelectedGenre = from genre in tblGenre
								where genre.nom.Contains(Rechercher)
							    select genre;
			ViewBag.Genre = SelectedGenre.ToList();


			var tblTheme = db.Theme;
			var SelectedTheme =	 from theme in tblTheme
								 where theme.nom.Contains(Rechercher)
								 select theme;
			ViewBag.Theme = SelectedTheme.ToList();


			var tblDeveloppeur = db.Developpeur;
			var SelectedDeveloppeur =	 from Developpeur in tblDeveloppeur
										where Developpeur.nom.Contains(Rechercher)
										select Developpeur;
			ViewBag.Developpeur = SelectedDeveloppeur.ToList();


			var tblOS = db.SystemeExploitation;
			var SelectedOS =	from OS in tblOS
								where OS.tag.Contains(Rechercher)
								select OS;
			ViewBag.OS = SelectedOS.ToList();


			var tblplatforme = db.Platforme.Include(t => t.SystemeExploitation1).Include(t => t.TypePlatforme1);
			var SelectedPlatforme = from Plateforme in tblplatforme
									where Plateforme.tag.Contains(Rechercher)
									select Plateforme;
			ViewBag.Platforme = SelectedPlatforme.ToList();


			return View();
        }


    }
}