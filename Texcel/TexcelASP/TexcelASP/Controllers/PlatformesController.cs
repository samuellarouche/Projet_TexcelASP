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
    public class PlatformesController : Controller
    {
        private TexcelASP_SamNicEntities db = new TexcelASP_SamNicEntities();

        // GET: Platformes
        public ActionResult Index()
        {
            var platforme = db.Platforme.Include(p => p.SystemeExploitation1).Include(p => p.TypePlatforme1);
            return View(platforme.ToList());
        }

        // GET: Platformes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Platforme platforme = db.Platforme.Find(id);
            if (platforme == null)
            {
                return HttpNotFound();
            }
            return View(platforme);
        }

        // GET: Platformes/Create
        public ActionResult Create()
        {
            ViewBag.systemeExploitation = new SelectList(db.SystemeExploitation, "code", "nom");
            ViewBag.typePlatforme = new SelectList(db.TypePlatforme, "id", "nom");
            return View();
        }

        // POST: Platformes/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,nom,configuration,typePlatforme,systemeExploitation")] Platforme platforme)
        {
            if (ModelState.IsValid)
            {
                db.Platforme.Add(platforme);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.systemeExploitation = new SelectList(db.SystemeExploitation, "code", "nom", platforme.systemeExploitation);
            ViewBag.typePlatforme = new SelectList(db.TypePlatforme, "id", "nom", platforme.typePlatforme);
            return View(platforme);
        }

        // GET: Platformes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Platforme platforme = db.Platforme.Find(id);
            if (platforme == null)
            {
                return HttpNotFound();
            }
            ViewBag.systemeExploitation = new SelectList(db.SystemeExploitation, "code", "nom", platforme.systemeExploitation);
            ViewBag.typePlatforme = new SelectList(db.TypePlatforme, "id", "nom", platforme.typePlatforme);
            return View(platforme);
        }

        // POST: Platformes/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nom,configuration,typePlatforme,systemeExploitation")] Platforme platforme)
        {
            if (ModelState.IsValid)
            {
                db.Entry(platforme).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.systemeExploitation = new SelectList(db.SystemeExploitation, "code", "nom", platforme.systemeExploitation);
            ViewBag.typePlatforme = new SelectList(db.TypePlatforme, "id", "nom", platforme.typePlatforme);
            return View(platforme);
        }

        // GET: Platformes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Platforme platforme = db.Platforme.Find(id);
            if (platforme == null)
            {
                return HttpNotFound();
            }
            return View(platforme);
        }

        // POST: Platformes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Platforme platforme = db.Platforme.Find(id);
            db.Platforme.Remove(platforme);
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
