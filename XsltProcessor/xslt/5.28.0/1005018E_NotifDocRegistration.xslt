<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:ndr="urn:customs.ru:Information:EArchDocuments:NotifDocRegistration:5.24.0">
	<!-- Шаблон для типа NotifDocRegistrationType -->
	<xsl:template match="ndr:NotifDocRegistration">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: nowrap;}

					div.page
					{width: 190mm;
					margin: 10px auto;
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
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;}

					div.title, tr.title td
					{font-weight:bold;}

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
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Сведения о регистрации документа</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<div class="title marg-top">Реквизиты документа</div>
					<xsl:choose>
						<xsl:when test="ndr:RegisterDoc"><xsl:apply-templates select="ndr:RegisterDoc" mode="doc_1"/></xsl:when>
						<xsl:when test="ndr:WHRegisterDoc"><xsl:apply-templates select="ndr:WHRegisterDoc" mode="doc_2"/></xsl:when>
						<xsl:when test="ndr:FreeWHRegisterDoc"><xsl:apply-templates select="ndr:FreeWHRegisterDoc" mode="doc_3"/></xsl:when>
						<xsl:when test="ndr:ArcticRegisterDoc"><xsl:apply-templates select="ndr:ArcticRegisterDoc" mode="doc_3"/></xsl:when>
						<xsl:when test="ndr:AppAccountSystem"><xsl:apply-templates select="ndr:AppAccountSystem" mode="doc_3"/></xsl:when>
					</xsl:choose>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор соглашения/документа</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="ndr:DocID"/></td>
						</tr>
					</table>
					<xsl:if test="ndr:CustomsControl">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Результаты таможенного контроля</td>
								<td class="value graphMain" style="width:50%">
									<xsl:if test="ndr:CustomsControl='0' or ndr:CustomsControl='false' or ndr:CustomsControl='f'">расхождений нет</xsl:if>
									<xsl:if test="ndr:CustomsControl='1' or ndr:CustomsControl='true' or ndr:CustomsControl='t'">несоответствие по наименованию (количеству) с ДТ</xsl:if>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ndr:Customs">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Таможенный орган</td>
								<td class="value graphMain" style="width:50%">
									<xsl:if test="ndr:Customs/cat_ru:OfficeName">
										<xsl:value-of select="ndr:Customs/cat_ru:OfficeName"/> (</xsl:if>
									<xsl:value-of select="ndr:Customs/cat_ru:Code"/>
									<xsl:if test="ndr:Customs/cat_ru:OfficeName">)</xsl:if>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ndr:RegDateTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время регистрации</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ndr:RegDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(ndr:RegDateTime, 12, 5)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AgreementNumType -->
	<xsl:template match="*" mode="doc_1">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационные реквизиты документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PrDocumentName"/>
					<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
					<xsl:if test="cat_ru:PrDocumentDate">
						<xsl:text> от </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</xsl:if>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="doc_2">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационные реквизиты документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
					<xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
					<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="doc_3">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационные реквизиты документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ndr:CustomsCode"/>/<xsl:value-of select="substring(ndr:RegistrationDate,9,2)"/>
					<xsl:value-of select="substring(ndr:RegistrationDate,6,2)"/>
					<xsl:value-of select="substring(ndr:RegistrationDate,3,2)"/>/<xsl:value-of select="ndr:RegistrationNumber"/>/<xsl:value-of select="ndr:DocKind"/>
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
</xsl:stylesheet>
