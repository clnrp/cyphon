#cimport numpy
import numpy as np
import pymysql as MySQLdb
import time
import os
import logging

logging.getLogger().setLevel(logging.DEBUG)
logging.basicConfig(filename=os.path.abspath(os.getcwd())+'/test_cy.log', filemode='a+', format='%(asctime)s-%(levelname)s: %(message)s', datefmt='%d-%b-%y %H:%M:%S')

class Sql:

    def __init__(self):
        self.conn = None
        self.cur = None
        self.connect()

    def connect(self):
        try:
            self.conn = MySQLdb.connect(host="localhost", user="test", passwd="test123", db="tests", cursorclass=MySQLdb.cursors.DictCursor)
        except MySQLdb.Error as ex:
            logging.error(str(ex))

    def disconnect(self):
        try:
            self.conn.close()
        except MySQLdb.Error as ex:
            logging.error(str(ex))

    def sqlExc(self, sql):
        result = ''
        try:
            self.cur = self.conn.cursor()
            if isinstance(sql, list):
                for cmd in sql:
                    self.cur.execute(cmd)
                self.conn.commit()
                result = self.cur.lastrowid
            else:
                self.cur.execute(sql)
                if sql.find('select') != -1:
                    result = self.cur.fetchall()
                else:
                    self.conn.commit()
                    result = self.cur.lastrowid
            self.conn.rollback()
        except MySQLdb.err.OperationalError as ex:
            self.connect()
            time.sleep(1)
            raise Exception(str(ex))
        except Exception as ex:
            self.connect()
            time.sleep(1)
            raise Exception("Mysql fail:"+str(ex))
        return result

def showMysqlData():
    sql = Sql()
    result = sql.sqlExc("select * from test1")
    return result

def npsum(n):
    x  = np.array([0,0,0,0,0])
    for i in range(n):
        x  += np.array([1,1,1,1,1])
    return x

def fibon_py(n):
    a = b = 1
    result = []
    for i in range(n):
        result.append(a)
        a, b = b, a + b
    return result

cpdef fibon(int n):
    cdef int a = 1
    cdef int b = 1
    result = []
    for i in range(n):
        result.append(a)
        a, b = b, a + b
    return result