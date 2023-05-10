﻿using System;
using System.Text;
using System.Xml;

namespace Triggerless.XAFLib
{
    [Serializable]

    public class SkeletalEffectControls : IndexXmlGenerator
    {
        public EffectCompositionFunction? EffectCompositionFunction { get; set; }
        public int? LoopIterations { get; set; }
        public int? RampUpFrames { get; set; }
        public int? RampDownFrames { get; set; }
        public float? PlaybackSpeedScale { get; set; }

        public override void AddXml(XmlElement parent, int? index = null) {
            if (parent?.OwnerDocument != null) {
                XmlElement result = parent.OwnerDocument.CreateElement("EffectControls");
                XmlElement ecf = parent.OwnerDocument.CreateElement("EffectCompositionFunction");
                ecf.InnerText = EffectCompositionFunction.ToString();
                result.AppendChild(ecf);

                if (LoopIterations.HasValue) {
                    XmlElement li = parent.OwnerDocument.CreateElement("LoopIterations");
                    li.InnerText = LoopIterations.Value.ToString();
                    result.AppendChild(li);
                }

                if (RampUpFrames.HasValue)
                {
                    if (parent.OwnerDocument != null)
                    {
                        XmlElement ruf = parent.OwnerDocument.CreateElement("RampUpFrames");
                        ruf.InnerText = RampUpFrames.Value.ToString();
                        result.AppendChild(ruf);
                    }
                }

                if (RampDownFrames.HasValue)
                {
                    if (parent.OwnerDocument != null)
                    {
                        XmlElement rdf = parent.OwnerDocument.CreateElement("RampDownFrames");
                        rdf.InnerText = RampDownFrames.Value.ToString();
                        result.AppendChild(rdf);
                    }
                }

                if (PlaybackSpeedScale.HasValue)
                {
                    if (parent.OwnerDocument != null)
                    {
                        XmlElement pss = parent.OwnerDocument.CreateElement("PlaybackSpeedScale");
                        pss.InnerText = PlaybackSpeedScale.Value.ToString();
                        result.AppendChild(pss);
                    }
                }

                parent.AppendChild(result);
            }
        }

        public override void AppendText(StringBuilder sb, int? index = null) {
            string tagName;
            sb.AppendUnixLine(Open("EffectControls"));

            if (EffectCompositionFunction.HasValue) {
                tagName = "EffectCompositionFunction";
                sb.AppendUnixLine(Open(tagName) + EffectCompositionFunction + Close(tagName));
            }

            if (LoopIterations.HasValue) {
                tagName = "LoopIterations";
                sb.AppendUnixLine(Open(tagName) + LoopIterations + Close(tagName));
            }

            if (RampUpFrames.HasValue)
            {
                tagName = "RampUpFrames";
                sb.AppendUnixLine(Open(tagName) + RampUpFrames + Close(tagName));
            }

            if (RampDownFrames.HasValue)
            {
                tagName = "RampDownFrames";
                sb.AppendUnixLine(Open(tagName) + RampDownFrames + Close(tagName));
            }

            if (PlaybackSpeedScale.HasValue)
            {
                tagName = "PlaybackSpeedScale";
                sb.AppendUnixLine(Open(tagName) + PlaybackSpeedScale + Close(tagName));
            }

            sb.AppendUnixLine(Close("EffectControls"));
        }

        public override void LoadXml(XmlNode node) {

            XmlElement ecf = node.SelectSingleNode("EffectCompositionFunction") as XmlElement;
            if (ecf != null && !string.IsNullOrWhiteSpace(ecf.InnerText)) {
                EffectCompositionFunction = (EffectCompositionFunction?) Enum.Parse(typeof(EffectCompositionFunction), ecf.InnerText);
            }

            XmlElement li = node.SelectSingleNode("LoopIterations") as XmlElement;
            if (li != null && !string.IsNullOrWhiteSpace(li.InnerText)) {
                LoopIterations = int.Parse(li.InnerText);
            }

            XmlElement ruf = node.SelectSingleNode("RampUpFrames") as XmlElement;
            if (ruf != null && !string.IsNullOrWhiteSpace(ruf.InnerText))
            {
                RampUpFrames = int.Parse(ruf.InnerText);
            }

            XmlElement rdf = node.SelectSingleNode("RampDownFrames") as XmlElement;
            if (rdf != null && !string.IsNullOrWhiteSpace(rdf.InnerText))
            {
                RampDownFrames = int.Parse(rdf.InnerText);
            }

            XmlElement pss = node.SelectSingleNode("PlaybackSpeedScale") as XmlElement;
            if (pss != null && !string.IsNullOrWhiteSpace(pss.InnerText))
            {
                PlaybackSpeedScale = float.Parse(pss.InnerText);
            }
        }
    }

}
