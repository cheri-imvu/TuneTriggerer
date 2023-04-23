﻿using NVorbis;
using System;
using System.Collections.Generic;
using System.IO;
using System.Windows.Forms;

namespace Triggerless.TriggerBot
{
    public partial class Form1 : Form
    {
        private const string OGG_FILE = @"E:\AUDIO\MUSIC\Steely Dan\Aja\New Folder\02-Aja.ogg";

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            var dtStart = DateTime.Now;
            using (var fs = File.OpenRead(OGG_FILE))
            {
                double result = VorbisReader.GetOggLengthMS(fs);
                var dtEnd = DateTime.Now;
                label1.Text = ($"{result} ms\nTime to complete: {(dtEnd - dtStart).TotalMilliseconds} ms");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var c = new Collector();
            var t = c.ScanDatabases();
        }
    }
}