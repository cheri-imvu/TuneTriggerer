﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TuneTriggerer
{
    public class ProductEntry
    {
        public string Name { get; set; }
        public long Id { get; set; }
        public Image ProductImage { get; set; }
        public string Creator { get; set; }
        public string ImageLocation { get; set; }

    }
}
