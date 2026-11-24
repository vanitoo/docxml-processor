<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.24.0" xmlns:mpoea="urn:customs.ru:Information:CustomsDocuments:MPOEXArrive:5.28.0">
	<!-- Шаблон для типа MPOEXArriveType -->
	<xsl:template match="mpoea:MPOEXArrive">
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
										<b>Уведомление о прибытии МПО в ММПО при экспорте</b>
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
					<xsl:if test="mpoea:Reestr_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер реестра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpoea:Reestr_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoea:MPOReestr">
						<div class="title marg-top">Регистрационный номер реестра МПО</div>
						<div>
							<xsl:apply-templates select="mpoea:MPOReestr">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mpoea:MPO_Registration">
						<div class="title marg-top">Регистрационный номер МПО</div>
						<div>
							<xsl:apply-templates select="mpoea:MPO_Registration">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mpoea:DTReg">
						<div class="title marg-top">Регистрационный номер ЭДТ (декларации на товары)</div>
						<div>
							<xsl:apply-templates select="mpoea:DTReg">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время формирования документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="mpoea:DocDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mpoea:ZTKTime">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время размещения МПО в зоне таможенного контроля ММПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpoea:ZTKTime" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoea:CustomsCode">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Код таможенного органа, в регионе деятельности которого расположена зона таможенного контроля ММПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpoea:CustomsCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoea:MPO_Violation">
						<div class="title marg-top">Акт о состоянии почтового отправления </div>
						<div>
							<xsl:apply-templates select="mpoea:MPO_Violation">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mpoea:DiffDoc">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Признак наличия расхождений ранее поданных сведений со сведениями из документов, сопровождающих поступившее МПО в ММПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="mpoea:DiffDoc='true' or mpoea:DiffDoc='1'">
											<xsl:text>ДА</xsl:text>
										</xsl:when>
										<xsl:when test="mpoea:DiffDoc='false' or mpoea:DiffDoc='0'">
											<xsl:text>НЕТ</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="mpoea:DiffDoc"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoea:DocumentInfo">
						<div class="title marg-top">Уточненные сведения из сопровождающих документов</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование документа</td>
									<td class="graphMain bordered">Номер документа</td>
									<td class="graphMain bordered">Дата документа</td>
									<td class="graphMain bordered">Код вида документа </td>
									<td class="graphMain bordered">Идентификаторы, присвоенные документу (сведениям) при размещении в хранилище электронных документов</td>
								</tr>
								<xsl:for-each select="mpoea:DocumentInfo">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="mpoea:DTReg">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="." mode="reg_num"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:RFBasePresentedDocIDType -->
	<xsl:template match="mpoea:DocArchIdDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">
				<br/>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа mpoea:DocumentInfoType -->
	<xsl:template match="mpoea:DocumentInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpoea:PrecedingDocumentModeCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="mpoea:DocArchIdDetails">
						<xsl:apply-templates select="mpoea:DocArchIdDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpoea:MPOReestr">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="." mode="reg_num"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpoea:MPO_RegistrationType -->
	<xsl:template match="mpoea:MPO_Registration">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="." mode="reg_num"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="mpoea:MPO_Violation">
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
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[2]" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[3]"/>
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
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='MPOEXArrive']//*" priority="-1">
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
