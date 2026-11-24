<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:chr="urn:customs.ru:Information:CustomsDocuments:CopyrightHolderRequest:5.24.0">
	<!-- Шаблон для типа CopyrightHolderRequestType -->
	<xsl:template match="chr:CopyrightHolderRequest">
		<xsl:param name="w" select="190"/>
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
										<b>Запрос таможенным органом дополнительной информации правообладателя (его представителя)</b>
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
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="chr:RequestDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="chr:RequestNumber"/>
							</td>
						</tr>
					</table>
					<xsl:if test="chr:IPObjectRegistryNum">
						<div class="title marg-top">Сведения об объекте интеллектуальной собственности</div>
						<div>
							<xsl:apply-templates select="chr:IPObjectRegistryNum">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="chr:CustomsDoc">
						<div class="title marg-top">Таможенный документ</div>
						<div>
							<xsl:apply-templates select="chr:CustomsDoc">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Сведения о товарах</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Номер товара</td>
								<td class="graphMain bordered">Наименование (коммерческое, фирменное или иное традиционное наименование) товаров/ «Товары согласно прилагаемому Списку». Гр.31 первый подраздел</td>
							</tr>
							<xsl:for-each select="chr:Goodsinfo">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Запрос дополнительной информации :</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="chr:IntelRightsViolationSigns='1'">
										<xsl:text>о наличии представителя иностранного правообладателя на территории Российской Федерации</xsl:text>
									</xsl:when>
									<xsl:when test="chr:IntelRightsViolationSigns='2'">
										<xsl:text>о лицах</xsl:text>
									</xsl:when>
									<xsl:when test="chr:IntelRightsViolationSigns='3'">
										<xsl:text>о признаках нарушения прав на ОИС</xsl:text>
									</xsl:when>
									<xsl:when test="chr:IntelRightsViolationSigns='4'">
										<xsl:text>иное</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="chr:IntelRightsViolationSigns"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="chr:IntelRightsViolationText">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Описаниеи признаков нарушения интеллектуальных прав</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="chr:IntelRightsViolationText">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Суть запроса</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="chr:SubstanceRequest">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<xsl:if test="chr:CustomsInfo">
						<div class="title marg-top">Таможенный орган</div>
						<div>
							<xsl:apply-templates select="chr:CustomsInfo">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="chr:CopyrightHolder">
						<div class="title marg-top">Правообладатель (его представитель)</div>
						<div>
							<xsl:apply-templates select="chr:CopyrightHolder">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Срок представления ответа на запроса (дата и время)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="chr:ResponseDeadline" mode="russian_datetime"/>
								<xsl:text> </xsl:text>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа chr:CopyrightHolderType -->
	<xsl:template match="chr:CopyrightHolder">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН правообладателя (его представителя)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="chr:OGRN"/>
					</td>
				</tr>
			</table>
			<xsl:if test="chr:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="chr:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="chr:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="chr:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование правообладателя (его представителя)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="chr:CopyrightHolderName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес электрнной почты правообладателя (его представителя)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="chr:CopyrightHolderE_mail"/>
					</td>
				</tr>
			</table>
			<xsl:if test="chr:OrganizationID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер организации, выбранной должностным лицом в перечне авторизованных правообладателей (их представителей) в АИСТ-М</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="chr:OrganizationID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="chr:CustomsDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа chr:CustomsInfoType -->
	<xsl:template match="chr:CustomsInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес электронной почты таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="chr:CustomsE_mail"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа chr:GoodsinfoType -->
	<xsl:template match="chr:Goodsinfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="chr:GoodsNumeric"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="chr:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="chr:IPOInfoDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа chr:IntellectualPropertyObjectsInfoType -->
	<xsl:template match="chr:IPObjectRegistryNum">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер ОИС по Реестру</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="chr:IntelPropertyObjectNumber"/>
					</td>
				</tr>
			</table>
			<xsl:if test="chr:OISName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование ОИС. Товарный знак, место происхождения, объект авторского права, смежных прав, патент и т.д. Гр. 31.12</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="chr:OISName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="chr:IPOInfoDoc">
				<div class="title marg-top">Регистрационный номер ОИС в Роспатенте/ВОИС/иное </div>
				<div>
					<xsl:apply-templates select="chr:IPOInfoDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
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
	<xsl:template name="russian_datetime">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='CopyrightHolderRequest']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_datetime">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_datetime">
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
