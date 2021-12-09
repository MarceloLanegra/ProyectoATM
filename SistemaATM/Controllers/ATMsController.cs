using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SistemaATM.Controllers
{
    public class ATMsController : Controller
    {
        // GET: ATMs
        public ActionResult Index()
        {
            return View();
        }
    }
}