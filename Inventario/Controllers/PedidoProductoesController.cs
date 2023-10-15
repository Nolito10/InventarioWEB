using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Inventario.Models;

namespace Inventario.Controllers
{
    public class PedidoProductoesController : Controller
    {
        private inventario_modelContainer db = new inventario_modelContainer();

        // GET: PedidoProductoes
        public ActionResult Index()
        {
            var pedidoProductos = db.PedidoProductos.Include(p => p.Producto).Include(p => p.Pedido);
            return View(pedidoProductos.ToList());
        }

        // GET: PedidoProductoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PedidoProducto pedidoProducto = db.PedidoProductos.Find(id);
            if (pedidoProducto == null)
            {
                return HttpNotFound();
            }
            return View(pedidoProducto);
        }

        // GET: PedidoProductoes/Create
        public ActionResult Create()
        {
            ViewBag.ProductoId = new SelectList(db.Productos, "Id", "Descripcion");
            ViewBag.PedidoId = new SelectList(db.Pedidos, "Id", "Estado");
            return View();
        }

        // POST: PedidoProductoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Descripcion,ProductoId,PedidoId")] PedidoProducto pedidoProducto)
        {
            if (ModelState.IsValid)
            {
                db.PedidoProductos.Add(pedidoProducto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductoId = new SelectList(db.Productos, "Id", "Descripcion", pedidoProducto.ProductoId);
            ViewBag.PedidoId = new SelectList(db.Pedidos, "Id", "Estado", pedidoProducto.PedidoId);
            return View(pedidoProducto);
        }

        // GET: PedidoProductoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PedidoProducto pedidoProducto = db.PedidoProductos.Find(id);
            if (pedidoProducto == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductoId = new SelectList(db.Productos, "Id", "Descripcion", pedidoProducto.ProductoId);
            ViewBag.PedidoId = new SelectList(db.Pedidos, "Id", "Estado", pedidoProducto.PedidoId);
            return View(pedidoProducto);
        }

        // POST: PedidoProductoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Descripcion,ProductoId,PedidoId")] PedidoProducto pedidoProducto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pedidoProducto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductoId = new SelectList(db.Productos, "Id", "Descripcion", pedidoProducto.ProductoId);
            ViewBag.PedidoId = new SelectList(db.Pedidos, "Id", "Estado", pedidoProducto.PedidoId);
            return View(pedidoProducto);
        }

        // GET: PedidoProductoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PedidoProducto pedidoProducto = db.PedidoProductos.Find(id);
            if (pedidoProducto == null)
            {
                return HttpNotFound();
            }
            return View(pedidoProducto);
        }

        // POST: PedidoProductoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PedidoProducto pedidoProducto = db.PedidoProductos.Find(id);
            db.PedidoProductos.Remove(pedidoProducto);
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
