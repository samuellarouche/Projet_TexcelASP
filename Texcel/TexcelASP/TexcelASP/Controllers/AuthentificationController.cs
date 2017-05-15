using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TexcelASP.Models;

namespace TexcelASP.Controllers
{
    public class AuthentificationController : Controller
    {
        // GET: Authentification

        public ActionResult Connexion()
        {
            return View();
        }

        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        [HttpPost]
        public ActionResult Login(Employe user)
        {
            using (TexcelASP_SamNicEntities db = new TexcelASP_SamNicEntities())
            {
                try
                {
                    var _user = db.Employe.Where(u => u.matricule == user.matricule && u.mdp == user.mdp).FirstOrDefault();
                
                    Session["matricule"] = _user.matricule.ToString();
                    Session["categorieEmploi"] = _user.CategorieEmploi1.nom.ToString();
                    Session["prenom"] = _user.prenom.ToString();
                    Session["nom"] = _user.nom.ToString();

                    return RedirectToAction("Index", "Home");
                }
                catch
                {
                    ModelState.AddModelError("", "Matricule ou Mot de passe incorrect.");

                    ViewBag.erreurLogin = true;

                    return View();
                }
            }
   
        }

        [HttpPost]
        public ActionResult LogOff()
        {
            Session.RemoveAll();

            return RedirectToAction("Index", "Home");
        }

    }
}