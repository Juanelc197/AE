using DataAcces;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces
{
    public class tb_ConsumidoDAL
    {
        #region Ingresar Datos Consumido
        public static bool IngresarDatosConsumidor(tb_Consumidor consumidor)
        {
            try
            {
                using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
                {
                    bd.tb_Consumidor.Add(consumidor);
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

        #region Modificar Consumidor
        public static bool ModificarConsumidor(tb_Consumidor consumido)
        {
            try
            {
                using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
                {
                    bd.Entry(consumido).State = System.Data.Entity.EntityState.Modified;
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

        #region Visualzar  Consumidor
        public static List<tb_Consumidor> VisualizarConsumidor()
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Consumidor
                             select b).ToList();
                return query;
            }
        }
        #endregion

        #region Validación de email
        public static bool validaremail(string email)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Consumidor
                             where b.email== email
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

        #region Validación de name
        public static bool validarNAME(string name)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Consumidor
                             where b.Primer_Nombre == name
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

        #region Validación de lastname
        public static bool validarlastname(string lastname)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Consumidor
                             where b.Primer_Apellido == lastname
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
    }
}




