<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:stz_ead="urn:customs.ru:Information:ExchangeDocuments:STZ_ElectronicAccDoc:5.28.0">
	<!-- Шаблон для типа STZ_ElectronicAccDocType -->
	<xsl:template match="stz_ead:STZ_ElectronicAccDoc">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
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
										<b>Электронный учетный документ (ЭУД)</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Тип документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="stz_ead:DocType='1'">
										<xsl:text>ЭУД</xsl:text>
									</xsl:when>
									<xsl:when test="stz_ead:DocType='2'">
										<xsl:text>дополнение к ЭУД</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="stz_ead:DocType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="stz_ead:Customs">
						<div class="title marg-top">Сведения о таможенном органе</div>
						<div>
							<xsl:apply-templates select="stz_ead:Customs">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="stz_ead:EAD_IdentifNumber">
						<div class="title marg-top">Идентификационный номер ЭУД</div>
						<div>
							<xsl:apply-templates select="stz_ead:EAD_IdentifNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="stz_ead:AddEAD_Number">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер дополнения к ЭУД по порядку</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="stz_ead:AddEAD_Number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">ИНН лица, подающего ЭУД</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="stz_ead:INN"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата формирования ЭУД</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="stz_ead:EAD_FormationDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<xsl:if test="stz_ead:AddEAD_Date">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата формирования дополнения к ЭУД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="stz_ead:AddEAD_Date" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Признак ЭУД</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="stz_ead:EAD_Sign='1'">
										<xsl:text>СТЗ</xsl:text>
									</xsl:when>
									<xsl:when test="stz_ead:EAD_Sign='2'">
										<xsl:text>ПП</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="stz_ead:EAD_Sign"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="stz_ead:GoodsSTZ">
						<div class="title marg-top">Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны</div>
						<xsl:apply-templates select="stz_ead:GoodsSTZ">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
					<xsl:if test="stz_ead:ManufacturedGoods">
						<div class="title marg-top">Сведения о товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру СТЗ</div>
						<xsl:for-each select="stz_ead:ManufacturedGoods">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</xsl:if>
					<div class="title marg-top">Опись документов</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Наименование, номер, дата документа</td>
								<td class="graphMain bordered">Код вида</td>
								<td class="graphMain bordered">Идентификатор документа</td>
								<td class="graphMain bordered">Идентификатор хранилища</td>
								<td class="graphMain bordered">DocumentModeID</td>
								<td class="graphMain bordered">Порядковый номер позиции</td>
								<td class="graphMain bordered">Количество листов</td>
							</tr>
							<xsl:for-each select="stz_ead:DocList">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="stz_ead:SignatoryInformation">
						<div class="title marg-top">Сведения о подписанте ЭУД</div>
						<div>
							<xsl:apply-templates select="stz_ead:SignatoryInformation">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="stz_ead:EAD_ReferralDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата направления ЭУД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="stz_ead:EAD_ReferralDate" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="stz_ead:AddEAD_Quantity">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Количество дополнений к ЭУД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="stz_ead:AddEAD_Quantity"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="stz_ead:AccountingData">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="*" mode="doc">
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
	<!-- Шаблон для типа stz_ead:AnotherCustomsProcedureType -->
	<xsl:template match="stz_ead:AnotherCustomsProcedure">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:DeclarationKindCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:CustomsModeCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:DT_Number">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:GoodsNumeric"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:InfQuantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="stz_ead:AuthoritesDocument">
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
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="stz_ead:Conclusion">
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
	
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="stz_ead:Customs">
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
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="stz_ead:DT_Data">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="stz_ead:DT_Number">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<!-- Шаблон для типа stz_ead:DocListType -->
	<xsl:template match="stz_ead:DocList">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="." mode="doc"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:CustomsDocumentCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:ElectronicDocumentID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:ElectronicArchID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="catProc_ru:DocumentModeID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:SheetsNumber"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_ead:EAD_NumberType -->
	<xsl:template match="stz_ead:EAD_IdentifNumber">
		<xsl:for-each select="*">
			<xsl:if test="position() !=1">
				<xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="num_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа stz_ead:EAD_ListType -->
	<xsl:template match="stz_ead:EAD_List">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:EAD_IdentifNumber">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:EAD_GoodsNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:Quantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		</div>
	</xsl:template>
	
	<!-- Шаблон для типа stz_ead:GoodsInfoType -->
	<xsl:template match="stz_ead:GoodsInfo">
		<xsl:for-each select="stz_ead:GoodsDescription">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="stz_ead:TradeMark">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="stz_ead:TradeMark"/>
		</xsl:if>
		<xsl:if test="stz_ead:GoodsMark">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="stz_ead:GoodsMark"/>
		</xsl:if>
		<xsl:if test="stz_ead:GoodsModel">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="stz_ead:GoodsModel"/>
		</xsl:if>
		<xsl:if test="stz_ead:GoodsMarking">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="stz_ead:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="stz_ead:GoodsSort">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="stz_ead:GoodsSort"/>
		</xsl:if>
		<xsl:if test="stz_ead:GoodsStandard">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="stz_ead:GoodsStandard"/>
		</xsl:if>
		<xsl:if test="stz_ead:SerialNumber">
			<xsl:text>, номера: </xsl:text>
			<xsl:for-each select="stz_ead:SerialNumber">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа stz_ead:GoodsPlacementAndUseType -->
	<xsl:template match="stz_ead:GoodsPlacementAndUse|stz_ead:ManufacturedGoodsPlacementAndUse">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top" style="background-color: #ccc;">
				<xsl:value-of select="position()"/>
			</div>
			<xsl:if test="stz_ead:TransferToStorage">
				<div class="title marg-top">Передача на складирование (хранение)</div>
				<table>
					<tbody>
						<tr>
							<td class="graphMain bordered">Место хранения</td>
							<td class="graphMain bordered">Сведения о количестве</td>
						</tr>
						<xsl:for-each select="stz_ead:TransferToStorage">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:Storage"/>
								</td>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:InfQuantity" mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			
			<xsl:if test="stz_ead:TransferToProduction">
				<div class="title marg-top">Передача в производство</div>
				<table>
					<tbody>
						<tr>
							<td class="graphMain bordered">Сведения о товарах, которые будут изготовлены</td>
							<td class="graphMain bordered">Цель использования товара</td>
							<td class="graphMain bordered">Сведения о количестве товара, переданного в производство</td>
						</tr>
						<xsl:for-each select="stz_ead:TransferToProduction">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:GoodsInfo"/>
								</td>
								<td class="graphMain bordered">
									<xsl:choose>
										<xsl:when test="stz_ead:UsingTarget='1'">
											<xsl:text>переработка</xsl:text>
										</xsl:when>
										<xsl:when test="stz_ead:UsingTarget='2'">
											<xsl:text>обеспечение производственных процессов и технологий при производстве продукции</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="stz_ead:UsingTarget"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:InfQuantity" mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

			<xsl:if test="stz_ead:UseForConstruction">
				<div class="title marg-top">Использование для строительства</div>
				<table>
					<tbody>
						<tr>
							<td class="graphMain bordered">Наименование объекта строительства</td>
							<td class="graphMain bordered">Сведения о количестве</td>
						</tr>
						<xsl:for-each select="stz_ead:UseForConstruction">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:ConstructionName"/>
								</td>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:InfQuantity" mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

			<xsl:if test="stz_ead:ConsumptionGoodsProdActivities">
				<div class="title marg-top">Потребление товаров на территории СЭЗ в рамках производственной деятельности в соответствии с пп.4 п.1 ст.205 ТК ЕАЭС</div>
				<table>
					<tbody>
						<xsl:for-each select="stz_ead:ConsumptionGoodsProdActivities">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="." mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

			<xsl:if test="stz_ead:OtherConsumptionGoods">
				<div class="title marg-top">Потребление товаров в случаях, определенных Решением Совета Евразийской экономической комиссии от 20 декабря 2017 г. N 88</div>
				<table>
					<tbody>
						<xsl:for-each select="stz_ead:OtherConsumptionGoods">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="." mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

			<xsl:if test="stz_ead:DestructionGoods">
				<div class="title marg-top">Уничтожение товаров вследствие аварии, действия непреодолимой силы</div>
				<table>
					<tbody>
						<xsl:for-each select="stz_ead:DestructionGoods">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="." mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

			<xsl:if test="stz_ead:DestructionUnusableGoods">
				<div class="title marg-top">Уничтожение или передача на уничтожение товаров, пришедших в негодность</div>
				<table>
					<tbody>
						<xsl:for-each select="stz_ead:DestructionUnusableGoods">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="." mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

			<xsl:if test="stz_ead:TransferRightsOwnership">
				<div class="title marg-top">Передача прав владения, пользования и (или) распоряжения товарами</div>
				<table>
					<tbody>
						<xsl:for-each select="stz_ead:TransferRightsOwnership">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="." mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

			<xsl:if test="stz_ead:AnotherCustomsProcedure">
				<div class="title marg-top">Передача в производство</div>
				<table>
					<tbody>
						<tr>
							<td class="graphMain bordered">Код тип перемещения (ИМ/ЭК) </td>
							<td class="graphMain bordered">Код таможенной процедуры</td>
							<td class="graphMain bordered">Номер декларации на товары</td>
							<td class="graphMain bordered">Номер товара в декларации на товары</td>
							<td class="graphMain bordered">Сведения о количестве</td>
						</tr>
						<xsl:for-each select="stz_ead:AnotherCustomsProcedure">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:DeclarationKindCode"/>
								</td>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:CustomsModeCode"/>
								</td>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:DT_Number"/>
								</td>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:GoodsNumeric"/>
								</td>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:InfQuantity" mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

			<xsl:if test="stz_ead:ExportGoodsFromFEZ">
				<div class="title marg-top">Вывоз товаров с территории СЭЗ</div>
				<table>
					<tbody>
						<xsl:for-each select="stz_ead:ExportGoodsFromFEZ">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="." mode="infQuantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="*" mode="quantity">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']" mode="translate_number"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа stz_ead:GoodsSTZType -->
	<xsl:template match="stz_ead:GoodsSTZ">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top" style="background-color: #ccc;">
				<xsl:value-of select="position()"/>
			</div>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:EAD_GoodsNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о товарах</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:GoodsInfo"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Классификационный код товара в соответствии с ЕТН ВЭД ЕАЭС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:GoodsTNVEDCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Реквизиты документа бухгалтерского учета</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:AccountingDocDetails" mode="doc"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер декларации на товары</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:DT_Number"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Данные бухгалтерского учета</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:AccountingData" mode="quantity"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Данные из декларации на товары</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:DT_Data" mode="quantity"/>
					</td>
				</tr>
			</table>
			<div class="title marg-top">Сведения о размещении и использовании товара на территории ОЭЗ/ ТОР/ свободного порта Вдадивосток</div>
			<xsl:apply-templates select="stz_ead:GoodsPlacementAndUse">
				<xsl:with-param name="wdth" select="$w"/>
			</xsl:apply-templates>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_ead:ExportGoodsFromFEZType -->
	<xsl:template match="*" mode="infQuantity">
			<xsl:if test="stz_ead:PermissionNumber">
				<xsl:text>Разрешительный документ </xsl:text>
				<xsl:apply-templates select="stz_ead:PermissionNumber" mode="doc"/>
				<br/>
			</xsl:if>
			
			<xsl:text>Количество</xsl:text>
			<br/>
			<xsl:apply-templates select="stz_ead:Quantity" mode="quantity"/>
	</xsl:template>
	<!-- Шаблон для типа stz_ead:ManufacturedGoodsType -->
	<xsl:template match="stz_ead:ManufacturedGoods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top" style="background-color: #ccc;">
				<xsl:value-of select="position()"/>
			</div>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:EAD_GoodsNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о товарах</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:GoodsInfo"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Классификационный код товара в соответствии с ЕТН ВЭД ЕАЭС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:GoodsTNVEDCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Реквизиты документа бухгалтерского учета</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:AccountingDocDetails" mode="doc"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Статус товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="stz_ead:GoodsStatus = 1">иностранный товар</xsl:when>
							<xsl:when test="stz_ead:GoodsStatus = 2">товар ЕАЭС</xsl:when>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="stz_ead:Conclusion">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер заключения о статусе товара</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="stz_ead:Conclusion" mode="doc"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="stz_ead:GoodsQuantity" mode="quantity"/>
					</td>
				</tr>
			</table>
			<div class="title marg-top">Перечень уникальных идентификационных номеров ЭУД по товарам, помещенным под таможенную процедуру СТЗ, и использованным при изготовлении (получении) данного товара</div>
				<table>
					<tbody>
						<tr>
							<td class="graphMain bordered">Номер ЭУД</td>
							<td class="graphMain bordered">Номер товара в ЭУД</td>
							<td class="graphMain bordered">Количество товара</td>
						</tr>
						<xsl:for-each select="stz_ead:AnotherCustomsProcedure">
							<tr>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:EAD_IdentifNumber"/>
								</td>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:EAD_GoodsNumber"/>
								</td>
								<td class="graphMain bordered">
									<xsl:apply-templates select="stz_ead:Quantity" mode="quantity"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			<div class="title marg-top">Сведения о размещении и использовании изготовленного (полученного) товара на территории ОЭЗ/ ТОР/ свободного порта Вдадивосток</div>
			<xsl:apply-templates select="stz_ead:ManufacturedGoodsPlacementAndUse">
				<xsl:with-param name="wdth" select="$w"/>
			</xsl:apply-templates>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="*" mode="doc">

			<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
			<xsl:if test="*[local-name() = 'PrDocumentNumber']">
				<xsl:text> № </xsl:text>
				<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
			</xsl:if>
			<xsl:if test="*[local-name() = 'PrDocumentDate']">
				<xsl:text> от </xsl:text>
				<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
			</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа stz_ead:SignatoryInformationType -->
	<xsl:template match="stz_ead:SignatoryInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonSurname">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Фамилия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonSurname"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Имя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="stz_ead:AuthoritesDocument">
				<div class="title marg-top">Сведения о документе, удостоверяющем полномочия</div>
				<div>
					<xsl:apply-templates select="stz_ead:AuthoritesDocument">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<!-- Шаблон для типа stz_ead:TransferToProductionType -->
	<xsl:template match="stz_ead:TransferToProduction">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:if test="stz_ead:GoodsInfo">
						<xsl:apply-templates select="stz_ead:GoodsInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="stz_ead:UsingTarget='1'">
							<xsl:text>переработка</xsl:text>
						</xsl:when>
						<xsl:when test="stz_ead:UsingTarget='2'">
							<xsl:text>обеспечение производственных процессов и технологий при производстве продукции</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="stz_ead:UsingTarget"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:InfQuantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stz_ead:TransferToStorageType -->
	<xsl:template match="stz_ead:TransferToStorage">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:Storage"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stz_ead:InfQuantity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
			</tr>
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
	<xsl:template name="num_date">
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
	<xsl:template match="//*[local-name()='STZ_ElectronicAccDoc']//*" priority="-1">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
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
