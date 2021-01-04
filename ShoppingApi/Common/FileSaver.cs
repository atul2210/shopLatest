using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Drawing.Imaging;
using System.Drawing;

using System.IO;

namespace ShoppingApi.Common
{
    public class FileSaver
    {
        public static void SaveJpeg(string path, string imgDirectory, long quality)
        {

            System.Drawing.Image img = System.Drawing.Image.FromFile(path, true);
            ///// FileSaver.SaveJpeg(fullPath, myImage, 20);


            if (quality < 0 || quality > 100)
                throw new ArgumentOutOfRangeException("quality must be between 0 and 100.");

            // Encoder parameter for image quality 
            EncoderParameter qualityParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, quality);
            // JPEG image codec 
            ImageCodecInfo jpegCodec = GetEncoderInfo("image/jpeg");
            EncoderParameters encoderParams = new EncoderParameters(1);
            encoderParams.Param[0] = qualityParam;


           
            /// string datetimesecond = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss");
            //// datetimesecond = datetimesecond.Replace("/", "").Replace(":", "");
            string fileDirectory = DateTime.Now.ToString("MMMM dd") + DateTime.Now.Year.ToString();
            string createDirectory = null;
            string filename = null;
            
            createDirectory = imgDirectory + "\\" + fileDirectory;

            var index = path.LastIndexOf(@"\");

            if (index != -1)
            {
                filename = path.Substring((index + 1), (path.Trim().Length - 1) - index);
            }


            if (Directory.Exists(imgDirectory))
            {
                Directory.CreateDirectory(createDirectory);
               
                createDirectory = imgDirectory + "\\" + fileDirectory + "\\" + filename;   // createDirectory + "\\temp.jpg";
                img.Save(createDirectory, jpegCodec, encoderParams);
            }




           
            
        }


        private static ImageCodecInfo GetEncoderInfo(string mimeType)
        {
            // Get image codecs for all image formats 
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();

            // Find the correct image codec 
            for (int i = 0; i < codecs.Length; i++)
                if (codecs[i].MimeType == mimeType)
                    return codecs[i];

            return null;
        }


        private byte[] ReadAllBytes(string fileName)
        {
            byte[] buffer = null;
            using (FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read))
            {
                buffer = new byte[fs.Length];
                fs.Read(buffer, 0, (int)fs.Length);
                fs.Close();
            }
            return buffer;
        }

    }
}
