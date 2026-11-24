<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:rmc="urn:customs.ru:Information:CustomsDocuments:ReqMPOChange:5.24.0">
	<!-- Шаблон для типа ReqMPOChangeType -->
	<xsl:template match="rmc:ReqMPOChange">
		<xsl:param name="w" select="277"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Требование на внесение изменений в Реестр МПО</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:INNSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН владельца МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:INNSign"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:MCD_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Единый регистрационный номер доверенности в формате МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:MCD_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="rmc:Reestr_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер реестра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="rmc:Reestr_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rmc:ReqDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время формирования Требования</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="rmc:ReqDate" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Строки реестра МПО</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Уникальный номер записи</td>
								<td class="graphMain bordered">Номер по порядку в списке</td>
								<td class="graphMain bordered">Изменения по МПО</td>
							</tr>
							<xsl:for-each select="rmc:MPODetail">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:AmountType -->
	<xsl:template match="rmc:CorrectCost">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:apply-templates select="RUScat_ru:Amount" mode="translate_number"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:AmountType -->
	<xsl:template match="rmc:CorrectTotalCost">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="RUScat_ru:Amount" mode="translate_number"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:AmountType -->
	<xsl:template match="rmc:Cost">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:apply-templates select="RUScat_ru:Amount" mode="translate_number"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
	</xsl:template>
	<!-- Шаблон для типа rmc:GoodsType -->
	<xsl:template match="rmc:Goods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rmc:ListNumeric"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="rmc:GoodDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="rmc:CorrectGoodDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rmc:TradeMark"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rmc:TNVEDCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rmc:CorrectTNVEDCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="rmc:Cost">
						<xsl:apply-templates select="rmc:Cost">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="rmc:CorrectCost">
						<xsl:apply-templates select="rmc:CorrectCost">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rmc:GoodsComment"/>
				</td>
			</tr>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа rmc:MPODeclType -->
	<xsl:template match="rmc:MPODecl">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер МПО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="rmc:MPO_Number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="rmc:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, обладающего компетенцией по совершению таможенных операций, связанных с выпуском товаров</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rmc:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rmc:TotalCost">
				<div class="title marg-top">Заявленная общая стоимость товаров МПО</div>
				<div>
					<xsl:apply-templates select="rmc:TotalCost">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="rmc:CorrectTotalCost">
				<div class="title marg-top">Скорректированная общая стоимость товаров МПО</div>
				<div>
					<xsl:apply-templates select="rmc:CorrectTotalCost">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="rmc:Comment">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Примечания по изменению сведений в МПО</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="rmc:Comment"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rmc:Goods">
				<div class="title marg-top">Сведения о товарах</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Номер товара по порядку</td>
							<td class="graphMain bordered">Заявленное наименование товара </td>
							<td class="graphMain bordered">Скорректированное наименование товара </td>
							<td class="graphMain bordered">Наименование объекта интеллектуальной собственности</td>
							<td class="graphMain bordered">Заявленный код товара по ТН ВЭД ЕАЭС</td>
							<td class="graphMain bordered">Скорректированный код товара по ТН ВЭД ЕАЭС</td>
							<td class="graphMain bordered">Заявленная стоимость товара</td>
							<td class="graphMain bordered">Скорректированная стоимость товара</td>
							<td class="graphMain bordered">Примечания по изменению сведений в товаре</td>
						</tr>
						<xsl:for-each select="rmc:Goods">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Признак возврата НДС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="rmc:VATReturn='true' or rmc:VATReturn='1'">
								<xsl:text>ДА</xsl:text>
							</xsl:when>
							<xsl:when test="rmc:VATReturn='false' or rmc:VATReturn='0'">
								<xsl:text>НЕТ</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="rmc:VATReturn"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа rmc:MPODetailType -->
	<xsl:template match="rmc:MPODetail">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rmc:MPO_ID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rmc:RecNum"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="rmc:MPODecl">
						<xsl:apply-templates select="rmc:MPODecl">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:AmountType -->
	<xsl:template match="rmc:TotalCost">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="RUScat_ru:Amount" mode="translate_number"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
				</td>
			</tr>
		</table>
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
	<xsl:template match="//*[local-name()='ReqMPOChange']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
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
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
