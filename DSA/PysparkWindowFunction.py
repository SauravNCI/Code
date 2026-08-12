# Import your libraries
from pyspark.sql.functions import *
from pyspark.sql.window import *

# Start writing code
df = ms_employee_salary
window = Window.partitionBy('id').orderBy(col('salary').desc())
df = df.withColumn('r', rank().over(window))
df=df.select('id','first_name','last_name','salary','department_id').filter(col('r')==1)
df= df.orderBy('id')
df = df.dropDuplicates()

# To validate your solution, convert your final PySpark df to a pandas df
df.toPandas()