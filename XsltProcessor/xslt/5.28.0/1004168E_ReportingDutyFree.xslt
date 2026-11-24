<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format" 
	xmlns:ms="urn:schemas-microsoft-com:xslt" 
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" 
	xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" 
	xmlns:rdf="urn:customs.ru:ReportingCollection:ReportingDutyFree:5.27.0">

	<xsl:output method="html" indent="yes"/>
	<xsl:template match="rdf:ReportingDutyFree">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<title>
					<xsl:text>Форма отчетности владельца магазина беспошлинной торговли о товарах, помещенных под таможенную процедуру беспошлинной торговли и реализованных в магазине беспошлинной торговли</xsl:text>
				</title>
				<style>
          body {
          background: #cccccc;
          font-family: Arial;
          font-size: 10pt;
          }

          div.page {
          margin: 10px 6px;
          background: #ffffff;
          }

          .shtmp {
          float: right;
          line-height: 5pt;
          }

          .repname {
          text-align: center;
          font-weight: bold;
          padding-top: 70px;
          font-size: 12pt;
          }

          table.tovary {
          border-collapse: collapse;
          font-family: Arial;
          table-layout:fixed;
          word-wrap:break-word;
          width:320mm;
          font-size:10px;
          margin-left: auto;
          margin-right: auto;
          }

          table.tovary td {
          border: solid 1px windowtext;
          }


          table.no-edge-borders tr:first-child td {
          border-top: none;
          }

          /* Убираем нижнюю границу у последней строки */
          table.no-edge-borders tr:last-child td {
          border-bottom: none;
          }



          table.podpiska {
          width: 100%;
          margin-top: 50px;
          font-family: Arial;
          font-size: 10pt;
          }

          div.pageAlbum {

          width: 340mm;!important;
          margin-top: 10pt;
          margin-bottom: 10pt;
          margin-left: auto;
          margin-right: auto;
          padding: 10mm;
          padding-left: 10mm;
          background: #ffffff;
          border: solid .5pt #000000;
          text-align: left;
          }

          .underline {
          border-bottom: solid 1px #000000;
          margin: 1px 1px 0px 10px;
          vertical-align: top;
          }

          .rotate {
          height: 230px;
          white-space: nowrap;
          vertical-align: bottom;

          }

          .rotate <xsl:text disable-output-escaping="yes">></xsl:text> div {
          filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
          -moz-transform: rotate(270deg);
          -webkit-transform: rotate(270deg);
          -o-transform: rotate(270deg);
          -ms-transform: rotate(270deg);
          transform: rotate(270deg);
          width: 10px;
          margin: auto;

          }

          .rotate <xsl:text disable-output-escaping="yes">></xsl:text> div <xsl:text disable-output-escaping="yes">></xsl:text> div {
          padding-left: 0.5em;
          }

          .verticalTableHeader {
          height: 250px;
          text-align:center;
          g-origin:50% 50%;
          -moz-transform: rotate(270deg);
          -webkit-transform: rotate(270deg);
          -o-transform: rotate(270deg);
          -ms-transform: rotate(270deg);
          transform: rotate(270deg);

          }
          .verticalTableHeader p {
          margin:0 -150% ;
          display:inline-block;
          }
          .verticalTableHeader p:before{

          display:inline-block;
          vertical-align:middle;
          }


          /* Убираем верхнюю границу у первой строки */
          table.no-edge-borders tr:first-child td {
          border-top-style: hidden;
          }

          /* Убираем нижнюю границу у последней строки */
          table.no-edge-borders tr:last-child td {
          border-bottom-style: hidden;
          }

          /* Убираем левую границу у первого td в строке */
          table.no-edge-borders td:first-child {
          border-left-style: hidden;
          }
          /* Убираем правую границу у последнего td в строке */
          table.no-edge-borders td:last-child {
          border-right-style: hidden;
          }

          /* Общие стили таблицы (если нужны границы между ячейками) */
          table.no-edge-borders {
          border-collapse: collapse;
          }
          table.no-edge-borders td {
          border: 1px solid #ddd; /* Границы ячеек */
          }

          table.fixed-row-height tr {
          height: 80px; /* Высота строки */
          }
          table.fixed-row-height td {
          border: 1px solid black;
          }
        </style>
			</head>
			<body>
				<div class="pageAlbum">
					<div class="repname">
						<p>
              Отчет владельца магазина беспошлинной торговли <xsl:if test="rdf:ReportNumber">
				  <xsl:text> № </xsl:text>
				  <xsl:value-of select="rdf:ReportNumber"/>
              </xsl:if>
            </p>
						<br/>
					</div>
					<div>
						<table style="font-size:14px">
							<tr>
								<td style="width:80mm;">
                  Владелец магазина беспошлинной торговли
                </td>
								<td style="padding-left:10px" class="underline">
									<xsl:value-of select="rdf:Organization/rdf:OPF"/>
									<xsl:if test="rdf:Organization/rdf:OPF and rdf:Organization/RUScat_ru:OrganizationName">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="rdf:Organization/RUScat_ru:OrganizationName"/>
									<xsl:if test="rdf:Organization/RUScat_ru:OrganizationName and rdf:Organization/RUScat_ru:RFOrganizationFeatures/cat_ru:INN">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:if test="rdf:Organization/RUScat_ru:RFOrganizationFeatures/cat_ru:INN">
										<xsl:text>ИНН: </xsl:text>
										<xsl:value-of select="rdf:Organization/RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</xsl:if>
									<xsl:if test="rdf:Organization/RUScat_ru:RFOrganizationFeatures/cat_ru:INN and rdf:Organization/RUScat_ru:RFOrganizationFeatures/cat_ru:KPP">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:if test="rdf:Organization/RUScat_ru:RFOrganizationFeatures/cat_ru:KPP">
										<xsl:text>КПП: </xsl:text>
										<xsl:value-of select="rdf:Organization/RUScat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td>
								</td>
								<td style="font-size:11px; padding-left:10px">
                  (организационно-правовая форма, наименование, идентификационный номер налогоплательщика, код причины постановки на учет)
                </td>
							</tr>
						</table>
						<br/>
						<table style="table-layout:fixed; font-size:14px">
							<tr>
								<td style="width:515px;">Свидетельство о включении в реестр магазинов беспошлинной торговли от</td>
								<td align="center" class="underline">
									<xsl:for-each select="rdf:CertOfInclusion">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="rdf:CertOfInclusionDate"/>
										</xsl:call-template>
										<xsl:text> № </xsl:text>
										<xsl:value-of select="rdf:CertOfInclusionNumber"/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
						<table style="table-layout:fixed; margin-top:5px; margin-bottom:10px; font-size:14px; width:440px; margin-left: auto; margin-right: auto;">
							<tr>
								<td style="width:200px;">
                  Представляется за период с
                </td>
								<td align="center" class="underline" style="width:100px;">
									<xsl:value-of select='ms:format-date(rdf:BeginReportDate, "dd.MM.yy")'/>
								</td>
								<td align="center" style="width:40px;">
                  по
                </td>
								<td align="center" class="underline" style="width:100px;">
									<xsl:value-of select='ms:format-date(rdf:EndReportDate, "dd.MM.yy")'/>
								</td>
							</tr>
						</table>
					</div>
					<table class="tovary" style="border: solid 2px black;">
						<col width="2%"/>
						<col width="5%"/>
						<col width="6%"/>
						<col width="6%"/>
						<col width="4%"/>
						<col width="4%"/>
						<col width="4%"/>
						<col width="4%"/>
						<col width="4%"/>
						<col width="3%"/>
						<col width="4%"/>
						<col width="5%"/>
						<col width="3%"/>
						<col width="4%"/>
						<col width="6%"/>
						<col width="3%"/>
						<col width="6%"/>
						<col width="4%"/>
						<col width="4%"/>
						<col width="4%"/>
						<col width="6%"/>
						<col width="3%"/>
						<col width="6%"/>
						<tr style="text-align:center;">
							<td colspan="7" rowspan="2" style="border: solid 2px black;">
                Товары, помещенные под таможенную процедуру беспошлинной торговли
              </td>
							<td colspan="16" style="border: solid 2px black;">
                Товары, в отношении которых таможенная процедура беспошлинной торговли завершена
              </td>
						</tr>
						<tr style="text-align:center;">
							<td colspan="2" style="border: solid 2px black;">
                Реализацией в магазине беспошлинной торговли в соответствии с пунктом 1 статьи 246 Таможенного кодекса Евразийского экономического союза
              </td>
							<td colspan="3" style="border: solid 2px black;">
                Помещением под иные таможенные процедуры в соответствии с подпунктом 1 пункта 4, подпунктом 1 пункта 5 статьи 246 ТК ЕАЭС
              </td>
							<td colspan="3" style="border: solid 2px black;">
                Выпуском для использования в качестве припасов в соответствии с подпунктом 2 пункта 4 статьи 246 ТК ЕАЭС
              </td>
							<td colspan="2" style="border: solid 2px black;">
                Вывозом из магазина беспошлинной торговли на таможенную территорию Евразийского экономического союза на основании заявления декларанта в соответствии с подпунктом 2 пункта 5 статьи 246 ТК ЕАЭС
              </td>
							<td colspan="3" style="border: solid 2px black;">
                Помещением под таможенную процедуру выпуска для внутреннего потребления в соответствии с пунктом 2 статьи 246 ТК ЕАЭС
              </td>
							<td colspan="2" style="border: solid 2px black;">
                Остаток товара, помещенного под таможенную процедуру беспошлинной торговли, на конец отчетного периода
              </td>
							<td rowspan="2">
                Примечание (при наличии)
              </td>
						</tr>
						<tr>
							<td class="verticalTableHeader">
								<!--01-->
								<p>№ п/п</p>
							</td>
							<!--02-->
							<td class="verticalTableHeader">
								<p style="margin:0 -100%;">регистрационный номер декларации на товары / номер товара в декларации на товары"</p>
							</td>
							<!--03-->
							<td class="verticalTableHeader">
								<p style="margin:0 -100%;">
                  код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза
                </p>
							</td>
							<!--04-->
							<td class="verticalTableHeader">
								<p>
                  наименование товара и его описание
                </p>
							</td>
							<!--05-->
							<td class="verticalTableHeader">
								<p style="margin:0 -250%;">
                  количество товара / единица измерения
                </p>
							</td>
							<!--06-->
							<td class="verticalTableHeader">
								<p>буквенный код валюты, указанный в декларации на товары</p>
							</td>
							<!--07-->
							<td class="verticalTableHeader" style="border-right: solid 2px black;">
								<p>
                  стоимость товара в валюте, указанной в декларации на товары
                </p>
							</td>
							<!--08-->
							<td class="verticalTableHeader" style="border-left: solid 2px black;">
								<p style="margin:0 -250%;">
                  количество товара / единица измерения
                </p>
							</td>
							<!--09-->
							<td class="verticalTableHeader" style="border-right: solid 2px black;">
								<p>
                  стоимость товара в валюте, указанной в декларации на товары
                </p>
							</td>
							<!--10-->
							<td class="verticalTableHeader" style="border-left: solid 2px black;">
								<p style="margin:0 -250%;">
                  количество товара / единица измерения
                </p>
							</td>
							<!--11-->
							<td class="verticalTableHeader">
								<p>сведения, указанные в подразделе 1 графы 1 декларации на товары / код таможенной процедуры</p>
							</td>
							<!--12-->
							<td class="verticalTableHeader" style="border-right: solid 2px black;">
								<p>регистрационный номер таможенной декларации / номер товара в таможенной декларации</p>
							</td>
							<!--13-->
							<td class="verticalTableHeader" style="border-left: solid 2px black;">
								<p style="margin:0 -250%;">
                  количество товара / единица измерения
                </p>
							</td>
							<!--14-->
							<td class="verticalTableHeader">
								<p>сведения, указанные в подразделе 1 графы 1 декларации на товары / код таможенной процедуры</p>
							</td>
							<!--15-->
							<td class="verticalTableHeader" style="border-right: solid 2px black;">
								<p style="margin:0 -100%;">регистрационный номер декларации на товары / номер товара в декларации на товары</p>
							</td>
							<!--16-->
							<td class="verticalTableHeader" style="border-left: solid 2px black;">
								<p style="margin:0 -250%;">
                  количество товара / единица измерения
                </p>
							</td>
							<!--17-->
							<td class="verticalTableHeader" style="border-right: solid 2px black;">
								<p>документ, свидетельствующий о вывозе товаров</p>
							</td>
							<!--18-->
							<td class="verticalTableHeader" style="border-left: solid 2px black;">
								<p style="margin:0 -250%;">количество товара / единица измерения</p>
							</td>
							<!--19-->
							<td class="verticalTableHeader">
								<p>
                  сведения, указанные в подразделе 1 графы 1 декларации на товары / код таможенной процедуры
                </p>
							</td>
							<!--20-->
							<td class="verticalTableHeader" style="border-right: solid 2px black;">
								<p>регистрационный номер таможенной декларации / номер товара в таможенной декларации</p>
							</td>
							<!--21-->
							<td class="verticalTableHeader" style="border-left: solid 2px black;">
								<p>количество товара / единица измерения</p>
							</td>
							<!--22-->
							<td class="verticalTableHeader" style="border-right: solid 2px black;">
								<p style="margin:0 -250%;">
                  стоимость товара в валюте, указанной в декларации на товары
                </p>
							</td>
						</tr>
						<tr style="text-align:center;">
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
							<td>6</td>
							<td style="border-right: solid 2px black;">7</td>
							<td style="border-left: solid 2px black;">8</td>
							<td style="border-right: solid 2px black;">9</td>
							<td style="border-left: solid 2px black;">10</td>
							<td>11</td>
							<td style="border-right: solid 2px black;">12</td>
							<td style="border-left: solid 2px black;">13</td>
							<td>14</td>
							<td style="border-right: solid 2px black;">15</td>
							<td style="border-left: solid 2px black;">16</td>
							<td style="border-right: solid 2px black;">17</td>
							<td style="border-left: solid 2px black;">18</td>
							<td>19</td>
							<td style="border-right: solid 2px black;">20</td>
							<td style="border-left: solid 2px black;">21</td>
							<td style="border-right: solid 2px black;">22</td>
							<td style="border-left: solid 2px black;">23</td>
						</tr>
						<xsl:for-each select="rdf:GoodsInfo">
							<!-- Количество каждого элемента -->
							<xsl:variable name="count1" select="count(rdf:ProcCompletedGoods/rdf:OtherProcGoodsP1)"/>
							<xsl:variable name="count2" select="count(rdf:ProcCompletedGoods/rdf:StoresGoods)"/>
							<xsl:variable name="count3" select="count(rdf:ProcCompletedGoods/rdf:DutyFreeShopToEAEUGoods)"/>
							<xsl:variable name="count4" select="count(rdf:ProcCompletedGoods/rdf:DomesticUseProcGoods)"/>
							<!-- Структура для хранения счетчиков -->
							<xsl:variable name="elements">
								<element name="element1" count="{$count1}"/>
								<element name="element2" count="{$count2}"/>
								<element name="element3" count="{$count3}"/>
								<element name="element4" count="{$count4}"/>
							</xsl:variable>
							<!-- Поиск максимального значение -->
							<xsl:variable name="maxCount">
								<xsl:for-each select="ms:node-set($elements)/element">
									<xsl:sort select="@count" data-type="number" order="descending"/>
									<xsl:if test="position() = 1">
										<xsl:value-of select="@count"/>
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
							<tr style="text-align: center;">
								<!--Товары, помещенные под таможенную процедуру беспошлинной торговли-->
								<td>
									<xsl:value-of select="rdf:OrderNum"/>
								</td>
								<td>
									<xsl:apply-templates select="rdf:GTDNumber" mode="reg_num"/>
									<xsl:if test="((rdf:GTDNumber) and (rdf:GoodsNumeric))">
										<xsl:text>/</xsl:text>
									</xsl:if>
									<xsl:value-of select="rdf:GoodsNumeric"/>
								</td>
								<td>
									<xsl:value-of select="rdf:GoodsTNVEDCode"/>
								</td>
								<td>
									<xsl:value-of select="rdf:GoodsDescription"/>
								</td>
								<td>
									<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
									<xsl:if test="((rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
										<xsl:text> /</xsl:text>
										<br/>
									</xsl:if>
									<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
								</td>
								<td>
									<xsl:value-of select="rdf:CurrencyA3Code"/>
								</td>
								<td style="border-right: 2px solid black;">
									<xsl:value-of select="rdf:TotalCost"/>
								</td>
								<!--Реализацией в магазине беспошлинной торговли в соответствии с пунктом 1 статьи 246 Таможенного кодекса Евразийского экономического союза-->
								<td style="border-left: 2px solid black;">
									<xsl:value-of select="rdf:ProcCompletedGoods/rdf:DutyFreeShopGoods/rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
									<xsl:if test="((rdf:ProcCompletedGoods/rdf:DutyFreeShopGoods/rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:ProcCompletedGoods/rdf:DutyFreeShopGoods/rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
										<xsl:text> /</xsl:text>
										<br/>
									</xsl:if>
									<xsl:value-of select="rdf:ProcCompletedGoods/rdf:DutyFreeShopGoods/rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
									<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
								</td>
								<td style="border-right: 2px solid black;">
									<xsl:value-of select="rdf:ProcCompletedGoods/rdf:DutyFreeShopGoods/rdf:TotalCost"/>
									<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
								</td>
								<!--Помещением под иные таможенные процедуры в соответствии с подпунктом 1 пункта 4, подпунктом 1 пункта 5 статьи 246 ТК ЕАЭС-->
								<td style="border-left: 2px solid black;" valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:OtherProcGoodsP1">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="3%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:OtherProcGoodsP1">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:OtherProcGoodsP1) = $maxCount">
															<td>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
																<xsl:if test="((rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
																	<xsl:text> /</xsl:text>
																	<br/>
																</xsl:if>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
																<xsl:if test="((rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
																	<xsl:text> /</xsl:text>
																	<br/>
																</xsl:if>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<td valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:OtherProcGoodsP1">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="4%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:OtherProcGoodsP1">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:OtherProcGoodsP1) = $maxCount">
															<td>
																<xsl:value-of select="rdf:ChangedCustomsProcedure"/>
																<xsl:if test="((rdf:ChangedCustomsProcedure) and (rdf:CustomsModeCode))">
																	<xsl:text> / </xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:CustomsModeCode"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:value-of select="rdf:ChangedCustomsProcedure"/>
																<xsl:if test="((rdf:ChangedCustomsProcedure) and (rdf:CustomsModeCode))">
																	<xsl:text> / </xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:CustomsModeCode"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<td style="border-right: 2px solid black;" valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:OtherProcGoodsP1">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="5%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:OtherProcGoodsP1">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:OtherProcGoodsP1) = $maxCount">
															<td>
																<xsl:if test="rdf:GTDNumber">
																	<xsl:apply-templates select="rdf:GTDNumber" mode="reg_num"/>
																</xsl:if>
																<xsl:if test="((rdf:GTDNumber) and (rdf:GoodsNumeric))">
																	<xsl:text>/</xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:GoodsNumeric"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:if test="rdf:GTDNumber">
																	<xsl:apply-templates select="rdf:GTDNumber" mode="reg_num"/>
																</xsl:if>
																<xsl:if test="((rdf:GTDNumber) and (rdf:GoodsNumeric))">
																	<xsl:text>/</xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:GoodsNumeric"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<!--Выпуском для использования в качестве припасов в соответствии с подпунктом 2 пункта 4 статьи 246 ТК ЕАЭС-->
								<td style="border-left: 2px solid black;" valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:StoresGoods">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="3%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:StoresGoods">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:StoresGoods) = $maxCount">
															<td>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
																<xsl:if test="((rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
																	<xsl:text> /</xsl:text>
																	<br/>
																</xsl:if>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
																<xsl:if test="((rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
																	<xsl:text> /</xsl:text>
																	<br/>
																</xsl:if>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<td valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:StoresGoods">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="4%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:StoresGoods">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:StoresGoods) = $maxCount">
															<td>
																<xsl:value-of select="rdf:ChangedCustomsProcedure"/>
																<xsl:if test="((rdf:ChangedCustomsProcedure) and (rdf:CustomsModeCode))">
																	<xsl:text> / </xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:CustomsModeCode"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:value-of select="rdf:ChangedCustomsProcedure"/>
																<xsl:if test="((rdf:ChangedCustomsProcedure) and (rdf:CustomsModeCode))">
																	<xsl:text> / </xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:CustomsModeCode"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<td style="border-right: 2px solid black;" valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:StoresGoods">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="6%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:StoresGoods">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:StoresGoods) = $maxCount">
															<td>
																<xsl:if test="rdf:GtdRegNumber">
																	<xsl:apply-templates select="rdf:GtdRegNumber" mode="reg_num"/>
																</xsl:if>
																<xsl:if test="((rdf:GtdRegNumber) and (rdf:GoodsNumeric))">
																	<xsl:text>/</xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:GoodsNumeric"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:if test="rdf:GtdRegNumber">
																	<xsl:apply-templates select="rdf:GtdRegNumber" mode="reg_num"/>
																</xsl:if>
																<xsl:if test="((rdf:GtdRegNumber) and (rdf:GoodsNumeric))">
																	<xsl:text>/</xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:GoodsNumeric"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<!--Вывозом из магазина беспошлинной торговли на таможенную территорию Евразийского экономического союза на основании заявления декларанта в соответствии с подпунктом 2 пункта 5 статьи 246 ТК ЕАЭС-->
								<td style="border-left: 2px solid black;" valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:DutyFreeShopToEAEUGoods">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="3%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:DutyFreeShopToEAEUGoods">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:DutyFreeShopToEAEUGoods) = $maxCount">
															<td>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
																<xsl:if test="((rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
																	<xsl:text> /</xsl:text>
																	<br/>
																</xsl:if>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
																<xsl:if test="((rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
																	<xsl:text> /</xsl:text>
																	<br/>
																</xsl:if>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<td style="border-right: 2px solid black;" valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:DutyFreeShopToEAEUGoods">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="6%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:DutyFreeShopToEAEUGoods">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:DutyFreeShopToEAEUGoods) = $maxCount">
															<td>
																<xsl:value-of select="rdf:ReleaseDoc/cat_ru:PrDocumentName"/>
																<xsl:if test="rdf:ReleaseDoc/cat_ru:PrDocumentDate">
																	<xsl:text> от </xsl:text>
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="rdf:ReleaseDoc/cat_ru:PrDocumentDate"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="rdf:ReleaseDoc/cat_ru:PrDocumentNumber">
																	<xsl:text> № </xsl:text>
																	<xsl:value-of select="rdf:ReleaseDoc/cat_ru:PrDocumentNumber"/>
																</xsl:if>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:value-of select="rdf:ReleaseDoc/cat_ru:PrDocumentName"/>
																<xsl:if test="rdf:ReleaseDoc/cat_ru:PrDocumentDate">
																	<xsl:text> от </xsl:text>
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="rdf:ReleaseDoc/cat_ru:PrDocumentDate"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="rdf:ReleaseDoc/cat_ru:PrDocumentNumber">
																	<xsl:text> № </xsl:text>
																	<xsl:value-of select="rdf:ReleaseDoc/cat_ru:PrDocumentNumber"/>
																</xsl:if>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<!--Помещением под иные таможенные процедуры в соответствии с пунктом 2 статьи 246 ТК ЕАЭС-->
								<td style="border-left: 2px solid black;" valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:DomesticUseProcGoods">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="4%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:DomesticUseProcGoods">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:DomesticUseProcGoods) = $maxCount">
															<td>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
																<xsl:if test="((rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
																	<xsl:text> /</xsl:text>
																	<br/>
																</xsl:if>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
																<xsl:if test="((rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
																	<xsl:text> /</xsl:text>
																	<br/>
																</xsl:if>
																<xsl:value-of select="rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<td valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:DomesticUseProcGoods">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="4%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:DomesticUseProcGoods">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:DomesticUseProcGoods) = $maxCount">
															<td>
																<xsl:value-of select="rdf:ChangedCustomsProcedure"/>
																<xsl:if test="((rdf:ChangedCustomsProcedure) and (rdf:CustomsModeCode))">
																	<xsl:text> / </xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:CustomsModeCode"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:value-of select="rdf:ChangedCustomsProcedure"/>
																<xsl:if test="((rdf:ChangedCustomsProcedure) and (rdf:CustomsModeCode))">
																	<xsl:text> / </xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:CustomsModeCode"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<td style="border-right: 2px solid black;" valign="top">
									<xsl:if test="rdf:ProcCompletedGoods/rdf:DomesticUseProcGoods">
										<table class="no-edge-borders fixed-row-height" style="table-layout: fixed; font-size: 11px; text-align: center;">
											<col width="4%"/>
											<xsl:for-each select="rdf:ProcCompletedGoods/rdf:DomesticUseProcGoods">
												<tr>
													<xsl:choose>
														<xsl:when test="count(../rdf:DomesticUseProcGoods) = $maxCount">
															<td>
																<xsl:if test="rdf:GTDNumber">
																	<xsl:apply-templates select="rdf:GTDNumber" mode="reg_num"/>
																</xsl:if>
																<xsl:if test="((rdf:GTDNumber) and (rdf:GoodsNumeric))">
																	<xsl:text>/</xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:GoodsNumeric"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td style="border-bottom: 1px solid black;">
																<xsl:if test="rdf:GTDNumber">
																	<xsl:apply-templates select="rdf:GTDNumber" mode="reg_num"/>
																</xsl:if>
																<xsl:if test="((rdf:GTDNumber) and (rdf:GoodsNumeric))">
																	<xsl:text>/</xsl:text>
																</xsl:if>
																<xsl:value-of select="rdf:GoodsNumeric"/>
																<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
											</xsl:for-each>
										</table>
									</xsl:if>
								</td>
								<!--Остаток товара, помещенного под таможенную процедуру беспошлинной торговли-->
								<td style="border-left: 2px solid black;">
									<xsl:value-of select="rdf:ProcCompletedGoods/rdf:ProcRestGoods/rdf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
									<xsl:if test="((rdf:ProcCompletedGoods/rdf:ProcRestGoods/rdf:SupplementaryQuantity/cat_ru:GoodsQuantity) and (rdf:ProcCompletedGoods/rdf:ProcRestGoods/rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName))">
										<xsl:text> /</xsl:text>
										<br/>
									</xsl:if>
									<xsl:value-of select="rdf:ProcCompletedGoods/rdf:ProcRestGoods/rdf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
									<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
								</td>
								<td style="border-right: 2px solid black;">
									<xsl:value-of select="rdf:ProcCompletedGoods/rdf:ProcRestGoods/rdf:TotalCost"/>
									<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
								</td>
								<td style="border-left: 2px solid black;">
									<xsl:value-of select="rdf:ProcCompletedGoods/rdf:Note"/>
									<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<table class="podpiska">
						<tr style="text-align:center;">
							<td style="width:35%; padding-right:80px; vertical-align: bottom;">
								<xsl:value-of select="rdf:ReportPerson/cat_ru:PersonPost"/>
							</td>
							<td style="width:35%; padding-right:80px; vertical-align: bottom;">
								<xsl:value-of select="substring(rdf:ReportPerson/cat_ru:PersonName,1,1)"/>.
                <xsl:value-of select="substring(rdf:ReportPerson/cat_ru:PersonMiddleName,1,1)"/>.
                <xsl:value-of select="rdf:ReportPerson/cat_ru:PersonSurname"/>
							</td>
							<td style="padding-right:150px;">
								<!--Штамп ЭП-->
								<!--div style="text-align: right">
									<xsl:text disable-output-escaping="yes"><![CDATA[<img src="../GetSignInfo?id=]]></xsl:text>
									<xsl:value-of select="$id"/>
									<xsl:text disable-output-escaping="yes"><![CDATA[" />]]></xsl:text>
								</div-->
							</td>
						</tr>
						<tr style="text-align:center; ">
							<td style="padding-right:80px;">
								<div class="underline"/>
							</td>
							<td style="padding-right:80px;">
								<div class="underline"/>
							</td>
							<td style="padding-right:150px;">
								<div class="underline"/>
							</td>
						</tr>
						<tr style="text-align:center;">
							<td style="padding-right:80px; vertical-align: top;">
                (должность уполномоченного работника)
              </td>
							<td style="padding-right:80px; vertical-align: top;">
                (инициалы, фамилия)
              </td>
							<td style="padding-right:150px; vertical-align: top;">
                (подпись)
              </td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:if test="((cat_ru:CustomsCode) or (cat_ru:RegistrationDate) or (cat_ru:GTDNumber))">
			<xsl:value-of select="cat_ru:CustomsCode"/>
			<xsl:if test="((cat_ru:CustomsCode) and (cat_ru:RegistrationDate))">
				<br/>
        /
      </xsl:if>
			<xsl:value-of select='ms:format-date(cat_ru:RegistrationDate, "ddMMyy")'/>
			<xsl:if test="((cat_ru:RegistrationDate) and (cat_ru:GTDNumber))">
				<br/>
        /
      </xsl:if>
			<xsl:value-of select="cat_ru:GTDNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<br/>от<br/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		</xsl:call-template>
		<br/>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
	</xsl:template>
</xsl:stylesheet>
