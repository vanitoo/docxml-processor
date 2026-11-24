<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС России от 23 июня 2011 г. N 1327 "Об утверждении форм отчетности о товарах, помещенных под таможенную процедуру свободной таможенной зоны, и товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, и порядка представления таможенному органу отчетности о таких товарах" -->
<xsl:stylesheet exclude-result-prefixes="math" version="1.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:math="http://exslt.org/math" xmlns:sez_rf1="urn:customs.ru:Information:CustomsDocuments:SEZReportForm1:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
   <!-- Шаблон для типа SEZReportForm1Type -->
   <xsl:template match="sez_rf1:SEZReportForm1">
	<html>
		<head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Формы отчетности о товарах, помещенных под таможенную процедуру свободной таможенной зоны, и товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны. Форма №1</title>
            <style type="text/css">
				body
				{text-align: center;}
				
				table
				{border: 0;
				cellpadding: 0;
				cellspacing: 0;
				width:100%;
				border-collapse: collapse;}
				
				td
				{font-size: 10.0pt;
				font-family: Arial, sans-serif;
				color: windowtext;
				font-weight: 400;
				font-style: normal;
				text-decoration: none;
				text-align: general;
				vertical-align: top;
				/*white-space: nowrap;
				*/ padding-left: 4pt}
				
				td.bold
				{font-size: 10.0pt;
				font-family: Arial, sans-serif;
				color: windowtext;
				font-weight: 700;
				font-style: normal;
				text-decoration: none;
				text-align: general;
				vertical-align: bottom;
				/*white-space: nowrap;*/}
				
				td.border-left
				{border-left: medium none;
				border-right: .5pt solid black;}
				
				td.border
				{border-left: .5pt solid windowtext;
				border-right: .5pt solid windowtext;
				border-top: .5pt solid windowtext;
				border-bottom: .5pt solid windowtext;}
				
				td.border-left
				{border-left: .5pt solid windowtext;
				border-right: medium none;
				border-top: medium none;
				border-bottom: medium none;}
				
				td.border-right
				{border-left: medium none;
				border-right: .5pt solid windowtext;
				border-top: medium none;
				border-bottom: medium none;}
				
				td.border-top
				{border-left: medium none;
				border-right: medium none;
				border-top: .5pt solid windowtext;
				border-bottom: medium none;}
				
				td.border-bottom
				{border-left: medium none;
				border-right: medium none;
				border-top: medium none;
				border-bottom: .5pt solid windowtext;}
				
				td.border-top-bottom
				{border-left: medium none;
				border-right: medium none;
				border-top: .5pt solid windowtext;
				border-bottom: .5pt solid windowtext;}
				
				td.border-top-right
				{border-left: medium none;
				border-right: .5pt solid windowtext;
				border-top: .5pt solid windowtext;
				border-bottom: medium none;}
				
				td.border-top-right-bottom
				{border-left: medium none;
				border-right: .5pt solid windowtext;
				border-top: .5pt solid windowtext;
				border-bottom: .5pt solid windowtext;}
				
				td.border-left-right-bottom
				{border-left: .5pt solid windowtext;
				border-right: .5pt solid windowtext;
				border-top: medium none;
				border-bottom: .5pt solid windowtext;}
				
				td.border-right-bottom
				{border-left: medium none;
				border-right: .5pt solid windowtext;
				border-top: medium none;
				border-bottom: .5pt solid windowtext;}
				
				td.border-left-bottom
				{border-left: .5pt solid windowtext;
				border-right: medium none;
				border-top: medium none;
				border-bottom: .5pt solid windowtext;}
				
				td.border-left-right
				{border-left: .5pt solid windowtext;
				border-right: .5pt solid windowtext;
				border-top: medium none;
				border-bottom: medium none;}
				
				span.bold
				{font-size: 10.0pt;
				font-family: Arial, sans-serif;
				color: windowtext;
				font-weight: 700;
				font-style: normal;}
				
				span.value
				{font-size: 12.0pt;
				font-family: Courier;
				color: windowtext;}
				
				div.page
				{width: 297mm;
				height: 210mm;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm;
				padding-left: 20mm;
				background: #ffffff;
				border: solid 1pt #000000;}
				
				p.number-date
				{font-weight: bold;}
				
				.bordered
				{border: solid 1pt #000000;
				padding-top:4pt;
				padding-bottom:4pt;}
				
				.inlinetable
				{border: 0;
				empty-cells: show;
				border-collapse: collapse;
				margin-top: 1px;
				display: -moz-inline-stack;/*Firefox 2*/
				display: inline-table; /*Хорошие браузеры*/
				_overflow: hidden;/*IE6, IE7*/
				*zoom: 1;/*включаем hasLayout для IE6, IE7*/
				*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
				text-indent: 0;
				vertical-align: top;
				align: center;
				text-align: center;}
				
				.value
				{border-bottom: solid 1px black;
				font-style: italic;
				vertical-align:bottom;}
				
				.descr
				{font-size: 7pt;
				text-align: center;
				vertical-align:top;}
				
				.underlined
				{border-bottom: solid 0.8pt #000000;}
				
				.graph
				{font-family: Arial;
				font-size: 7pt;}
				
				.graphUnderlined
				{font-family: Arial;
				font-size: 7pt;
				border-top: solid 0.8pt #000000}
				
				.graph-number
				{font-size: 9pt;
				font-weight: bold;}
			</style>
		</head>
		<body>
            <div>
				<table style="width:297mm">
					<tbody>
						<tr>
						   <td align="left">
							  <b>Форма № 1</b>
						   </td>
						</tr>
						<tr>
							<td align="center"><b><xsl:text>ОТЧЕТНОСТЬ</xsl:text><br/>
								<xsl:text>о товарах, помещенных под таможенную процедуру</xsl:text><br/>
								<xsl:text>свободной таможенной зоны, за период</xsl:text><br/>
								<xsl:text>с </xsl:text>
								<xsl:call-template name="DateStr">
									<xsl:with-param name="date" select="sez_rf1:BeginReportDate"/>
								</xsl:call-template>
								<xsl:text> по </xsl:text>
								<xsl:call-template name="DateStr">
									<xsl:with-param name="date" select="sez_rf1:EndReportDate"/>
								</xsl:call-template><br/>
								<xsl:text>по состоянию на </xsl:text>
								<xsl:call-template name="DateStr">
									<xsl:with-param name="date" select="sez_rf1:ReportDate"/>
								</xsl:call-template>
								<xsl:text> на </xsl:text>
								<u><xsl:apply-templates select="sez_rf1:SheetsNumber"/></u>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:text>л.</xsl:text></b>
							</td>
						</tr>
						<tr>
						   <td align="center">
								<xsl:text>от </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="sez_rf1:Organization/cat_ru:OrganizationName"/>
										<xsl:text>, ОГРН - </xsl:text>
										<xsl:apply-templates select="sez_rf1:Organization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
										<xsl:text>,</xsl:text> 
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(наименование организации, ОГРН, адрес)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
						   </td>
						</tr>
						<tr>
						   <td align="center">
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:text>адрес: </xsl:text>
										<xsl:for-each select="sez_rf1:Organization/sez_rf1:Address">
											<xsl:call-template name="Address"/>
										</xsl:for-each>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
						   </td>
						</tr>
						<tr>
							<td align="center">
								<xsl:text>М.П. </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="sez_rf1:ReportPerson" mode="fio"/>
										<xsl:text>, дата - </xsl:text>
										<xsl:apply-templates select="sez_rf1:ReportPerson/cat_ru:IssueDate" mode="russian_date"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(Ф.И.О., подпись уполномоченного лица, на которое возложена ответственность составления отчетности, дата)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<table border="1" style="width:297mm">
					<tbody>
						<tr>
						   <td rowspan="3" style="width:5mm">№ п/п</td>
						   <td rowspan="3" style="width:15mm">Наиме- нова- ние това- ров</td>
						   <td rowspan="3" style="width:13mm">Код товаров (10 знаков по ТН ВЭД ЕАЭС)</td>
						   <td rowspan="3" style="width:10mm">Еди- ница изме- рения коли- чества това- ров, ука- зан- ного в гра- фах 5 - 9, 12, 14, 16 - 20</td>
						   <td colspan="3" style="width:36mm">Количество то- варов, поме- щенных под та- моженную про- цедуру сво- бодной тамо- женной зоны</td>
						   <td colspan="13" style="width:195mm">Распоряжение за отчетный период товарами, помещенными под таможенную процедуру свободной таможенной зоны (далее - СТЗ)</td>
						</tr>
						<tr>
						   <td rowspan="2" style="width:11mm">на на- чало от- чет- ного пе- рио- да</td>
						   <td rowspan="2" style="width:12mm">на ко- нец от- чет- ного пе- рио- да</td>
						   <td rowspan="2" style="width:13mm">все- го за от- чет- ный пе- риод</td>
						   <td rowspan="2" style="width:11mm">товары, подверг- нутые операци- ям по пере- работке (обра- ботке) (коли- чество)</td>
						   <td rowspan="2" style="width:11mm">товары, потреб- ленные на тер- ритории ОЭЗ, без учета това- ров, указан- ных в графе 19 (коли- чество)</td>
						   <td colspan="3" style="width:40mm">изменение таможенной процедуры СТЗ на иную таможенную процедуру, в том числе при передаче прав владения, пользования и (или) распоряжения другому(им) резиденту(ам)</td>
						   <td colspan="2" style="width:33mm">уничтожено на территории ОЭЗ вследствие аварии или действия непреодолимой силы или с разрешения таможенного органа</td>
						   <td colspan="2" style="width:33mm">иное использование товаров <sup>1</sup></td>
						   <td colspan="2" style="width:40mm">изменение статуса товаров (сведения о завершении таможенной процедуры СТЗ в отношении товаров, помещенных под таможенную процедуру СТЗ, при прекращении функционирования ОЭЗ и в случае утраты лицом статуса резидента в соответствии с пунктами 5, 8 статьи 15 Соглашения о СЭЗ <sup>2</sup>)</td>
						   <td rowspan="2" style="width:13mm">товары, исполь- зованные в соот- ветствии с пунк- том 4 статьи 13 Сог- лашения о СЭЗ (коли- чество)</td>
						   <td rowspan="2" style="width:13mm">товары, находя- щиеся у резидента ОЭЗ, в отношении которых осущест- вляется хранение (склади- рование) на терри- тории ОЭЗ (количе- ство)</td>
						</tr>
						<tr>
						   <td style="width:10mm">код тамо- мо- жен- ной про- цеду- ры <sup>3</sup></td>
						   <td style="width:18mm">N тамо- женной деклара- ции, в соответ- ствии с которой товары помещены под иную таможен- ную про- цедуру</td>
						   <td style="width:12mm">коли- чество товара</td>
						   <td style="width:13mm">дата и номер доку- мента, подтвер- ждающего факт уничто- жения товаров</td>
						   <td style="width:20mm">количество товаров в соответст- вии с доку- ментом, подтвер- ждающим факт унич- тожения товаров, указанным в графе 13</td>
						   <td style="width:13mm">дата и номер докумен- та, под- твержда- ющего факт исполь- зования товаров</td>
						   <td style="width:20mm">дата и номер докумен- та, под- твержда- ющего факт исполь- зования товаров</td>
						   <td style="width:20mm">количество товаров, в отношении которых таможенная процедура СТЗ завер- шена при прекращении функциони- рования ОЭЗ</td>
						   <td style="width:20mm">количество товаров, в отношении которых таможенная процедура СТЗ за- вершена в случае утраты лицом статуса резидента</td>
						</tr>
						<tr align="center">
						   <td>1</td>
						   <td>2</td>
						   <td>3</td>
						   <td>4</td>
						   <td>5</td>
						   <td>6</td>
						   <td>7</td>
						   <td>8</td>
						   <td>9</td>
						   <td>10</td>
						   <td>11</td>
						   <td>12</td>
						   <td>13</td>
						   <td>14</td>
						   <td>15</td>
						   <td>16</td>
						   <td>17</td>
						   <td>18</td>
						   <td>19</td>
						   <td>20</td>
						</tr>
						<!-- Вывод товаров со статусом ИМ -->
						<xsl:if test="sez_rf1:GoodsGI">
						   <tr>
							  <td colspan="20">Иностранные товары</td>
						   </tr>
						   <xsl:for-each select="sez_rf1:GoodsGI">
								<tr>
									<td>
										<xsl:value-of select="sez_rf1:Number"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:Name"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:TNVEDCode"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:MeasureUnitQualifierName"/>
										<xsl:text> (</xsl:text>
										<xsl:value-of select="sez_rf1:MeasureUnitQualifierCode"/>
										<xsl:text>)</xsl:text>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsQuantity/sez_rf1:Begin"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsQuantity/sez_rf1:End"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsQuantity/sez_rf1:Total"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:RecycledGoods"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:ConsumedGoods"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:ProcedureChanged/sez_rf1:CustomsModeCode"/>
									</td>
									<td>
										<xsl:apply-templates select="sez_rf1:SEZGoodsDisposal/sez_rf1:ProcedureChanged/sez_rf1:GTDID"/>
									</td>
									<td>
										<xsl:for-each select="sez_rf1:SEZGoodsDisposal/sez_rf1:ProcedureChanged/sez_rf1:DTGoods">
											<xsl:if test="position()!=1">, </xsl:if>
											<xsl:value-of select="sez_rf1:Quantity"/>
										</xsl:for-each>
									</td>
									<td>
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:Destroyed/sez_rf1:DocumentInfo/cat_ru:PrDocumentNumber"/>
										<xsl:text> от </xsl:text>
										<xsl:apply-templates select="sez_rf1:SEZGoodsDisposal/sez_rf1:Destroyed/sez_rf1:DocumentInfo/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:Destroyed/sez_rf1:Quantity"/>
									</td>
									<td>
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:OtherUse/sez_rf1:DocumentInfo/cat_ru:PrDocumentNumber"/>
										<xsl:text> от </xsl:text>
										<xsl:apply-templates select="sez_rf1:SEZGoodsDisposal/sez_rf1:OtherUse/sez_rf1:DocumentInfo/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:OtherUse/sez_rf1:Quantity"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:StatusChanged/sez_rf1:OperationTermination"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:StatusChanged/sez_rf1:ResidentStatusLoss"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:UsedGoods"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:StorageGoods"/>
									</td>
								</tr>
						   </xsl:for-each>
						</xsl:if>
						<!-- Вывод товаров со статусом ЕАЭС -->
						<xsl:if test="sez_rf1:GoodsGU">
						   <tr>
							  <td colspan="20">Товары Таможенного союза</td>
						   </tr>
						   <xsl:for-each select="sez_rf1:GoodsGU">
								<tr>
									<td>
										<xsl:value-of select="sez_rf1:Number"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:Name"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:TNVEDCode"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:MeasureUnitQualifierName"/>
										<xsl:text> (</xsl:text>
										<xsl:value-of select="sez_rf1:MeasureUnitQualifierCode"/>
										<xsl:text>)</xsl:text>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsQuantity/sez_rf1:Begin"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsQuantity/sez_rf1:End"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsQuantity/sez_rf1:Total"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:RecycledGoods"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:ConsumedGoods"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:ProcedureChanged/sez_rf1:CustomsModeCode"/>
									</td>
									<td>
										<xsl:apply-templates select="sez_rf1:SEZGoodsDisposal/sez_rf1:ProcedureChanged/sez_rf1:GTDID"/>
									</td>
									<td>
										<xsl:for-each select="sez_rf1:SEZGoodsDisposal/sez_rf1:ProcedureChanged/sez_rf1:DTGoods">
											<xsl:if test="position()!=1">, </xsl:if>
											<xsl:value-of select="sez_rf1:Quantity"/>
										</xsl:for-each>
									</td>
									<td>
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:Destroyed/sez_rf1:DocumentInfo/cat_ru:PrDocumentNumber"/>
										<xsl:text> от </xsl:text>
										<xsl:apply-templates select="sez_rf1:SEZGoodsDisposal/sez_rf1:Destroyed/sez_rf1:DocumentInfo/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:Destroyed/sez_rf1:Quantity"/>
									</td>
									<td>
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:OtherUse/sez_rf1:DocumentInfo/cat_ru:PrDocumentNumber"/>
										<xsl:text> от </xsl:text>
										<xsl:apply-templates select="sez_rf1:SEZGoodsDisposal/sez_rf1:OtherUse/sez_rf1:DocumentInfo/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:OtherUse/sez_rf1:Quantity"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:StatusChanged/sez_rf1:OperationTermination"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:StatusChanged/sez_rf1:ResidentStatusLoss"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:UsedGoods"/>
									</td>
									<td>
										<xsl:value-of select="sez_rf1:SEZGoodsDisposal/sez_rf1:StorageGoods"/>
									</td>
								</tr>
						   </xsl:for-each>
						</xsl:if>
					</tbody>
				</table>
            </div>
         </body>
      </html>
   </xsl:template>

	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
	</xsl:template>
	<xsl:template match="*" mode="initial">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
		</element>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $list=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>.
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="$data"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$list != 0">
						<td width="1%" valign="bottom">;</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0 or $list != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='SEZReportForm1']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		&#34;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#34;
		&#160;&#160;<u>&#160;
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose> 					
		</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
	</xsl:template>
  	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template name="Address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="sez_rf1:SEZGoodsDisposal/sez_rf1:GTDID">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
