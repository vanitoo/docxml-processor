<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:prpef="urn:customs.ru:Information:ProcessingDocuments:PermitReplaceProdEquivForeign:5.28.0">
	<xsl:variable name="indent" select="2"/>
	<!-- Шаблон для типа PermitReplaceProdEquivForeignType -->
	<xsl:template match="prpef:PermitReplaceProdEquivForeign">
		<xsl:param name="w" select="180"/>
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

                  table.int
                  {
                  width: 96%;
                  margin-left: 5px;
                  margin-right: 5px;
                  table-layout: fixed;
                  }

                  table.ext_border
                  {
                  width: 100%;
                  border: 1px solid windowtext;
                  border-collapse: separate;
                  table-layout: fixed;
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
                  vertical-align:bottom;
                  }

                  .annot
                  {
                  /*font-weight:bold;*/
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  td.annot
                  {
                  vertical-align:bottom;
                  padding-top: 5px;
                  }

                  .annot_t
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  vertical-align:top;
                  }

                  .underline
                  {
                  font-family: Arial;
                  font-size: 7pt;
                  vertical-align:top;
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

                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="value" align="center"><xsl:value-of select="prpef:CustomsAdministration"/></td>
							</tr>
							<tr>
								<td class="underline" align="center"><xsl:text>(наименование регионального таможенного управления)</xsl:text></td>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:for-each select="prpef:Customs">
										<xsl:if test="cat_ru:OfficeName">
											<xsl:text>(</xsl:text>
										</xsl:if>
										<xsl:value-of select="cat_ru:Code"/>
										<xsl:if test="cat_ru:OfficeName">
											<xsl:text>) </xsl:text>
											<xsl:value-of select="cat_ru:OfficeName"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="underline" align="center"><xsl:text>Наименование таможни</xsl:text></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Разрешение</xsl:text>
											<br/>
											<xsl:text>на замену продуктов переработки эквивалентными иностранными товарами при совершении операций </xsl:text>
											<xsl:text>по гарантийному (безвозмездному) ремонту</xsl:text>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot_t">
								<p style="text-indent: {$indent}%; text-align:justify;">
									<xsl:text>1. Полное и сокращенное наименование лица, получившего разрешение на переработку товаров вне таможенной территории в форме </xsl:text>
									<xsl:text>декларации на товары №&#160;</xsl:text><u>&#160;&#160;<xsl:apply-templates select="prpef:PermitDTNumber"/>&#160;&#160;</u><xsl:text>: </xsl:text>
								</p>
							</td>
						</tr>
						<tr>
							<td class="value">
								<xsl:value-of select="prpef:ApplicantInfomation/prpef:OrganizationName"/>
								<xsl:if test="prpef:ApplicantInfomation/cat_ru:ShortName">
									<xsl:if test="prpef:ApplicantInfomation/cat_ru:OrganizationName">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="prpef:ApplicantInfomation/cat_ru:ShortName"/>
									<xsl:if test="prpef:ApplicantInfomation/cat_ru:OrganizationName">
										<xsl:text>)</xsl:text>
									</xsl:if>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="annot">
								<table>
									<tr>
										<td class="annot" width="65%"><xsl:text>Идентификационный номер налогоплательщика: </xsl:text></td>
										<td class="value" width="35%"><xsl:value-of select="prpef:ApplicantInfomation/prpef:INN"/></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="annot">
								<xsl:text>Юридический адрес: </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value">
								<xsl:apply-templates select="prpef:ApplicantInfomation/prpef:Address"/>
								<br/>
							</td>
						</tr>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot_t">
								<p style="text-indent: {$indent}%;text-align:justify;">
									<xsl:text>2. Наименование и реквизиты документов, которыми предусмотрена возможность замены продуктов </xsl:text>
									<xsl:text>переработки эквивалентными иностранными товарами:</xsl:text>
								</p>
							</td>
						</tr>
						<tr>
							<td class="value">
								<xsl:for-each select="prpef:PossiblReplaceDoc">
									<xsl:apply-templates select="." mode="doc"/>
									<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
								</xsl:for-each>
								<br/>
							</td>
						</tr>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot_t">
								<p style="text-indent: {$indent}%;">
									<xsl:text>3. Эквивалентные иностранные товары:</xsl:text>
								</p>
							</td>
						</tr>
					</table>
					<xsl:call-template name="EquivForeignGoodsTbl">
						<xsl:with-param name="node" select="prpef:EquivForeignGoods"/>
					</xsl:call-template>
					<br/>
					<table>
						<tr>
							<td class="annot">
								<xsl:apply-templates select="prpef:PersonSignature">
									<xsl:with-param name="fio_descr" select="'Фамилия, имя, отчество (при наличии) начальника таможни (лица, его замещающего)'"/>
								</xsl:apply-templates>
							</td>
						</tr>
						<tr>
							<td class="underline"> <br/></td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="*" mode="doc">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>

	<!--Таблица с Эквивалентными иностранными товарами (тип prpef:EquivForeignGoodsType)-->
	<xsl:template name="EquivForeignGoodsTbl">
		<xsl:param name="node"/>
		<xsl:param name="title_col4" select="'Количество'"/>
		<xsl:param name="title_col6" select="'Таможенный орган'"/>
		<xsl:param name="need_col_sum" select="'1'"/>
		
		<table class="border">
			<tr class="title">
				<td align="center" width="5%">№</td>
				<td align="center" width="35%">Наименование</td>
				<td align="center" width="15%">Код по ТН ВЭД ЕАЭС</td>
				<td align="center" width="15%">Количество</td>
				<td align="center" width="15%">Стоимость, руб.</td>
			</tr>
			<tr class="title">
				<td align="center">1</td>
				<td align="center">2</td>
				<td align="center">3</td>
				<td align="center">4</td>
				<td align="center">5</td>
			</tr>
			<xsl:for-each select="$node">
				<tr class="annot_t">
					<td align="center"><xsl:value-of select="catProc_ru:GoodsNamber"/></td>
					<td><xsl:apply-templates select="catProc_ru:GoodsDescription"/></td>
					<td><xsl:value-of select="catProc_ru:GoodsTNVEDCode"/></td>
					<td>
						<xsl:if test="catProc_ru:GoodsQuantity">
							<xsl:value-of select="translate(catProc_ru:GoodsQuantity,'.',',')"/>
						</xsl:if>	
						<xsl:if test="catProc_ru:MeasureUnitQualifierName or catProc_ru:MeasureUnitQualifierCode">
							<xsl:text> </xsl:text>
							<xsl:value-of select="catProc_ru:MeasureUnitQualifierName"/>	
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:value-of select="catProc_ru:MeasureUnitQualifierCode"/>	
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
					</td>
					<td>
						<xsl:if test="prpef:GoodsRubCost">
							<xsl:value-of select="translate(translate(format-number(prpef:GoodsRubCost, '#,###.00'),',',' '),'.',',')"/>
						</xsl:if>	
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- cat_ru:PersonSignatureType -->
	<xsl:template match="prpef:PersonSignature">
		<xsl:param name="fio_descr" select="''"/>
		<table>
			<tbody>
				<tr>
					<td class="value" width="50%" align="center">
						<xsl:if test="cat_ru:PersonPost">
							<xsl:value-of select="cat_ru:PersonPost"/>
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</xsl:if>
					</td>
					<td class="annot" width="3%"/>
					<td class="value" width="24%"/>
					<td class="annot" width="3%"/>
					<td class="value" width="20%" align="center">
						<xsl:if test="cat_ru:IssueDate">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="underline" align="left">
						<xsl:value-of select="$fio_descr"/>
					</td>
					<td class="underline"/>
					<td class="underline" align="center">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td class="underline"/>
					<td class="underline" align="center">
						<xsl:text>(дата)</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="underline" colspan="5"> <br/></td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType или cat_ru:AddressType-->
	<xsl:template match="prpef:Address">
		<xsl:for-each select="*">
			<xsl:if test="local-name()='AddressKindCode'">Код вида адреса: </xsl:if>
			<xsl:if test="local-name()='PostalCode'">Почтовый индекс: </xsl:if>
			<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
			<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
			<xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
			<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
			<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if>
			<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
			<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='CountryCode'">
					<xsl:if test="not(../RUScat_ru:CounryName) and not(../cat_ru:CounryName)">
						<xsl:value-of select="."/>
					</xsl:if>	
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
					<xsl:if test="local-name()='CounryName'">
						<xsl:if test="../RUScat_ru:CountryCode"> (<xsl:value-of select="../RUScat_ru:CountryCode"/>)</xsl:if>
						<xsl:if test="../cat_ru:CountryCode"> (<xsl:value-of select="../cat_ru:CountryCode"/>)</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:if test="local-name()!='CountryCode' or (local-name()='CountryCode' and not(../RUScat_ru:CounryName) and not(../cat_ru:CounryName))">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="prpef:PermitDTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
	<xsl:template name="gtd_date">
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
</xsl:stylesheet>
