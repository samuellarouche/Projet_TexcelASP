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
    public class JeuxController : Controller
    {
        private TexcelASP_SamNicEntities db = new TexcelASP_SamNicEntities();

        // GET: Jeux
        public ActionResult Index(string Rechercher = "")
        {
            var DBJeu = db.Jeu;
            var Query = from Jeu in DBJeu
                        where Jeu.tag.Contains(Rechercher)
                        select Jeu;
            return View(Query.ToList());
        }

        // GET: Jeux/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Jeu jeu = db.Jeu.Find(id);
            if (jeu == null)
            {
                return HttpNotFound();
            }
            return View(jeu);
        }

        // GET: Jeux/Create
        public ActionResult Create()
        {
            ViewBag.classification = new SelectList(db.Classification, "id", "nom");
            ViewBag.developpeur = new SelectList(db.Developpeur, "id", "nom");
            ViewBag.genre = new SelectList(db.Genre, "id", "nom");
            ViewBag.platforme = new SelectList(db.Platforme, "id", "nom");
            ViewBag.theme = new SelectList(db.Theme, "id", "nom");
            return View();
        }

        // POST: Jeux/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,nom,description,configMinimal,genre,theme,classification,developpeur,platforme")] Jeu jeu)
        {
            if (ModelState.IsValid)
            {
                jeu.tag = jeu.nom + jeu.description + jeu.configMinimal + jeu.genre + jeu.theme + jeu.classification + jeu.developpeur + jeu.platforme;
                db.Jeu.Add(jeu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.classification = new SelectList(db.Classification, "id", "nom", jeu.classification);
            ViewBag.developpeur = new SelectList(db.Developpeur, "id", "nom", jeu.developpeur);
            ViewBag.genre = new SelectList(db.Genre, "id", "nom", jeu.genre);
            ViewBag.platforme = new SelectList(db.Platforme, "id", "nom", jeu.platforme);
            ViewBag.theme = new SelectList(db.Theme, "id", "nom", jeu.theme);
            return View(jeu);
        }

        // GET: Jeux/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Jeu jeu = db.Jeu.Find(id);
            if (jeu == null)
            {
                return HttpNotFound();
            }
            ViewBag.classification = new SelectList(db.Classification, "id", "nom", jeu.classification);
            ViewBag.developpeur = new SelectList(db.Developpeur, "id", "nom", jeu.developpeur);
            ViewBag.genre = new SelectList(db.Genre, "id", "nom", jeu.genre);
            ViewBag.platforme = new SelectList(db.Platforme, "id", "nom", jeu.platforme);
            ViewBag.theme = new SelectList(db.Theme, "id", "nom", jeu.theme);
            return View(jeu);
        }

        // POST: Jeux/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nom,description,configMinimal,genre,theme,classification,developpeur,platforme")] Jeu jeu)
        {
            if (ModelState.IsValid)
            {
                jeu.tag = jeu.nom + jeu.description + jeu.configMinimal + jeu.genre + jeu.theme + jeu.classification + jeu.developpeur + jeu.platforme;
                db.Entry(jeu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.classification = new SelectList(db.Classification, "id", "nom", jeu.classification);
            ViewBag.developpeur = new SelectList(db.Developpeur, "id", "nom", jeu.developpeur);
            ViewBag.genre = new SelectList(db.Genre, "id", "nom", jeu.genre);
            ViewBag.platforme = new SelectList(db.Platforme, "id", "nom", jeu.platforme);
            ViewBag.theme = new SelectList(db.Theme, "id", "nom", jeu.theme);
            return View(jeu);
        }

        // GET: Jeux/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Jeu jeu = db.Jeu.Find(id);
            if (jeu == null)
            {
                return HttpNotFound();
            }
            return View(jeu);
        }

        // POST: Jeux/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Jeu jeu = db.Jeu.Find(id);
            db.Jeu.Remove(jeu);
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
