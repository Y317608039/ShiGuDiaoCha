using System;
using System.Security.Cryptography;
using System.Text;

namespace SGDC.Utility
{
    /// <summary>
    /// MD5加密
    /// </summary>
    public static class Encrypt_MD5
    {
        /// <summary>
        /// MD5加密字符串(UTF8)
        /// </summary>
        /// <param name="text">待加密文本</param>
        /// <returns>加密后的Base64文本</returns>
        public static string Encrypt(string text)
        {
			return Convert.ToBase64String(Encrypt(text, Encoding.UTF8));
        }

		/// <summary>
		/// MD5加密字符串
		/// </summary>
		/// <param name="text">待加密文本</param>
		/// <param name="encoding">对应编码</param>
		/// <returns>对应编码下的加密字节数组</returns>
		public static byte[] Encrypt(string text, Encoding encoding)
		{
			return Encrypt(encoding.GetBytes(text));
		}

		/// <summary>
		/// MD5加密字节数组
		/// </summary>
		/// <param name="src">待加密字节数组</param>
		/// <returns>加密后字节数组</returns>
		public static byte[] Encrypt(byte[] src)
		{
			MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
			return md5.ComputeHash(src);
		}
    }
}
