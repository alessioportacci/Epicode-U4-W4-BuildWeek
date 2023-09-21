using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Epicode_U4_W4_BuildWeek.Classes
{
    public class Libri
    {
        public int IDLibro { get; set; }
        public string Titolo { get; set; }
        public string Copertina { get; set; }
        public string Descrizione { get; set; }
        public string Anno { get; set; }
        public string Prezzo { get; set; }

        public string Autore { get; set; }
        public int IdGenere { get; set; }
        public string Genere { get; set; }
        public string Editore { get; set; }

    }
}