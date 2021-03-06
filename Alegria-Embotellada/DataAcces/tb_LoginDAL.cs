﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace DataAcces
{
   public class tb_LoginDAL
    {

        #region Validar Password y NameNick
        public static bool validarPasswordyNameNick(string password , string user)
        {
            using(AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Login
                             where b.PASSWORD == password && b.UserName== user
                             select b).Count();
                if(query > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        #endregion

        #region Validar Password y NameNick Formulario
        public static bool validarPasswordyNameNickFormulario(string password, string user)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Login
                             where b.PASSWORD == password || b.UserName == user
                             select b).Count();
                if (query > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
            #endregion

        #region Insertar Datos 
        public static bool IngresarDatos (tb_Login login)
        {   using (TransactionScope tran = new TransactionScope())
            {
                using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
                {
                    bd.tb_Login.Add(login);
                    bd.SaveChanges();
                    tran.Complete();
                    return true;              
                }
                
            }
           
        }
        #endregion

        #region Modificar Login
        public static bool ModificarLogin(tb_Login login)
        {
            try
            {
                using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
                {
                    bd.Entry(login).State = System.Data.Entity.EntityState.Modified;
                    bd.SaveChanges();
                    return true;
                }
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (DbEntityValidationResult entityErr in dbEx.EntityValidationErrors)
                {
                    foreach (DbValidationError erorr in entityErr.ValidationErrors)
                    {
                        Console.WriteLine("Error Property Name {0} : Error Message: {1}",
                            erorr.PropertyName, erorr.ErrorMessage);
                    }
                }
            }
            return false;
        }
        #endregion
    }
}
