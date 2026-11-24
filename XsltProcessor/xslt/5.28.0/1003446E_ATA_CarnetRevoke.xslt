<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.24.0" xmlns:ata_crev="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CarnetRevoke:5.25.0">
	<!-- Шаблон для типа ATA_CarnetRevokeType -->
	<xsl:template match="ata_crev:ATA_CarnetRevoke">
		<xsl:param name="w" select="190" />
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: normal;}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Решение об отзыве карнета АТА</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br />
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID" />
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:INNSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН владельца МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:INNSign" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:MCD_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Единый регистрационный номер доверенности в формате МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:MCD_ID" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата создания запроса/ответа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ata_crev:IssueDate" mode="russian_date" />
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер карнета АТА</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ata_crev:CarnetNumber" />
							</td>
						</tr>
					</table>
					<xsl:if test="ata_crev:Request">
						<div class="title marg-top">Обращение держателя (представителя держателя)</div>
						<div>
							<xsl:apply-templates select="ata_crev:Request">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ata_crev:CustomsPersonSignature">
						<div class="title marg-top">Должностное лицо, запрашивающее отзыв/согласовавшее отзыв</div>
						<div>
							<xsl:apply-templates select="ata_crev:CustomsPersonSignature">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ata_crev:AdditionalInformation">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Обоснование отзыва</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ata_crev:AdditionalInformation" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ata_crev:Decision">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Решение по запросу: 0 - отказ в отзыве, 1 - отозвать</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="ata_crev:Decision='true' or ata_crev:Decision='1'">
											<xsl:text>ДА</xsl:text>
										</xsl:when>
										<xsl:when test="ata_crev:Decision='false' or ata_crev:Decision='0'">
											<xsl:text>НЕТ</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="ata_crev:Decision" />
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="ata_crev:CustomsPersonSignature">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:LNP" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:CustomsCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="ata_crev:Request">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn" />
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ATA_CarnetRevoke']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()" />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates />
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="." />
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()" />
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])" />
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath" />
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')" />
		</element>
	</xsl:template>
</xsl:stylesheet>