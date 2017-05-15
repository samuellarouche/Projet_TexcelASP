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
    public class EmployesController : Controller
    {
        private TexcelASP_SamNicEntities db = new TexcelASP_SamNicEntities();

        // GET: Employes
        public ActionResult Index(string Rechercher = "")
        {
            var query = from employe in db.Employe
                        where employe.tag.Contains(Rechercher)
                        select employe;
            return View(query.ToList());
        }

        // GET: Employes/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employe employe = db.Employe.Find(id);
            if (employe == null)
            {
                return HttpNotFound();
            }
            return View(employe);
        }

        // GET: Employes/Create
        public ActionResult Create()
        {
            ViewBag.categorieEmploi = new SelectList(db.CategorieEmploi, "id", "nom");
            return View();
        }

        // POST: Employes/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "matricule,mdp,nom,prenom,dateNaissance,adresse,telResidentiel,posteTel,categorieEmploi")] Employe employe)
        {
            if (ModelState.IsValid)
            {
                employe.tag = employe.matricule + employe.prenom + employe.nom + employe.posteTel + employe.telResidentiel + employe.adresse + employe.categorieEmploi + employe.dateNaissance;
                db.Employe.Add(employe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.categorieEmploi = new SelectList(db.CategorieEmploi, "id", "nom", employe.categorieEmploi);
            return View(employe);
        }

        // GET: Employes/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employe employe = db.Employe.Find(id);
            if (employe == null)
            {
                return HttpNotFound();
            }
            ViewBag.categorieEmploi = new SelectList(db.CategorieEmploi, "id", "nom", employe.categorieEmploi);
            return View(employe);
        }

        // POST: Employes/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "matricule,mdp,nom,prenom,dateNaissance,adresse,telResidentiel,posteTel,categorieEmploi")] Employe employe)
        {
            if (ModelState.IsValid)
            {
                employe.tag = employe.matricule + employe.prenom + employe.nom + employe.posteTel + employe.telResidentiel + employe.adresse + employe.categorieEmploi  + employe.dateNaissance;
                db.Entry(employe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categorieEmploi = new SelectList(db.CategorieEmploi, "id", "nom", employe.categorieEmploi);
            return View(employe);
        }

        // GET: Employes/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employe employe = db.Employe.Find(id);
            if (employe == null)
            {
                return HttpNotFound();
            }
            return View(employe);
        }

        // POST: Employes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Employe employe = db.Employe.Find(id);
            db.Employe.Remove(employe);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
