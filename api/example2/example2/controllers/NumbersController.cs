using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace example2.controllers
{
    [Route("api/[controller]")]
    public class NumbersController : ControllerBase
    {
        [HttpGet]
        public List<int> Get()
        {
            Random rnd = new Random();
            // return Enumerable.Range(1, 6).OrderBy(_ => rnd.Next()).ToList();
            return Enumerable.Range(0, 6)
                         .Select(r => rnd.Next(100))
                         .ToList();
        }

        // GET api/values/size
        [HttpGet("{id}")]
        public List<int> Get(int id)
        {
            Random rnd = new Random();
            return Enumerable.Range(0, id)
                        .Select(r => rnd.Next(100))
                        .ToList();
        }
    }
}
