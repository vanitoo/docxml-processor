<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ncdt="urn:customs.ru:Information:CustomsDocuments:NotifConfirmDT:5.25.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="ncdt:NotifConfirmDT">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 190mm;
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
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									div.title, tr.title td { font-weight:bold;  }
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
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<span style="font-size:large; font-weight:bold; ">Уведомление о получении </span>
										<span style="font-size:large; font-weight:bold; ">
											<xsl:choose>
												<xsl:when test="ncdt:DocType='0'">ДТ</xsl:when>
												<xsl:when test="ncdt:DocType='1'">МПО</xsl:when>
												<xsl:when test="ncdt:DocType='2'">
													<br/>Заявления о выпуске до подачи</xsl:when>
												<xsl:when test="ncdt:DocType='3'">КДТ</xsl:when>
												<xsl:when test="ncdt:DocType='4'">ТД</xsl:when>
												<xsl:when test="ncdt:DocType='5'">
													<br/>Заявления о необходимости совершения операций в отношении товаров,<br/>находящихся под таможенным контролем</xsl:when>
												<xsl:when test="ncdt:DocType='6'">
													<br/>Реестра ЭГ</xsl:when>
												<xsl:when test="ncdt:DocType='7'">
													<br/>Обращения о внесении изменений в реестр ЭГ</xsl:when>
												<xsl:when test="ncdt:DocType='8'">
													<br/>Уведомления о регистрации предварительной декларации с возможностью использования в качестве ПИ</xsl:when>
												<xsl:otherwise>
													<br/>Неизвестного документа</xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:if test="ncdt:DocRecieptTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:36%">Дата/время получения документов в системе ТО в рабочее время:</td>
								<td class="nnot graphMain" style="width:2%" align="center"/>
								<td class="value graphMain" style="width:62%">
									<xsl:value-of select="substring(ncdt:DocRecieptTime,9,2)"/>
									<xsl:text>.</xsl:text>
									<xsl:value-of select="substring(ncdt:DocRecieptTime,6,2)"/>
									<xsl:text>.</xsl:text>
									<xsl:value-of select="substring(ncdt:DocRecieptTime,1,4)"/>
									<xsl:text>  </xsl:text>
									<xsl:value-of select="substring(ncdt:DocRecieptTime,12,8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ncdt:WorkTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:36%">Дата/время начала работы ТО:</td>
								<td class="nnot graphMain" style="width:2%" align="center"/>
								<td class="value graphMain" style="width:62%">
									<xsl:value-of select="substring(ncdt:WorkTime,9,2)"/>
									<xsl:text>.</xsl:text>
									<xsl:value-of select="substring(ncdt:WorkTime,6,2)"/>
									<xsl:text>.</xsl:text>
									<xsl:value-of select="substring(ncdt:WorkTime,1,4)"/>
									<xsl:text>  </xsl:text>
									<xsl:value-of select="substring(ncdt:WorkTime,12,8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:36%">Таможенный орган, направивший уведомление:</td>
							<td class="nnot graphMain" style="width:2%" align="center"/>
							<td class="value graphMain" style="width:62%">
								<xsl:value-of select="ncdt:Customs/cat_ru:Code"/> 
								<xsl:if test="ncdt:Customs/cat_ru:OfficeName">
									<xsl:text>  </xsl:text>
									<xsl:value-of select="ncdt:Customs/cat_ru:OfficeName"/>
								</xsl:if>
							</td>
						</tr>
					</table>
					<xsl:if test="ncdt:DocNumber">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:36%">Номер обращения о внесении изменений / Номер ПТД:</td>
								<td class="nnot graphMain" style="width:2%" align="center"/>
								<td class="value graphMain" style="width:62%">
									<xsl:apply-templates select="ncdt:DocNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ncdt:ObligationDeadline">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:36%">Предельная дата и время принятия решения по снятию средств идентификации:</td>
								<td class="nnot graphMain" style="width:2%" align="center"/>
								<td class="value graphMain" style="width:62%">
									<xsl:value-of select="substring(ncdt:ObligationDeadline,9,2)"/>
									<xsl:text>.</xsl:text>
									<xsl:value-of select="substring(ncdt:ObligationDeadline,6,2)"/>
									<xsl:text>.</xsl:text>
									<xsl:value-of select="substring(ncdt:ObligationDeadline,1,4)"/>
									<xsl:text>  </xsl:text>
									<xsl:value-of select="substring(ncdt:ObligationDeadline,12,8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ncdt:Comment">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:36%">Комментарии:</td>
								<td class="nnot graphMain" style="width:2%" align="center"/>
								<td class="value graphMain" style="width:62%">
									<xsl:value-of select="ncdt:Comment"/> 
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ncdt:RecordID">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:36%">Ссылочный идентификатор:</td>
								<td class="nnot graphMain" style="width:2%" align="center"/>
								<td class="value graphMain" style="width:62%">
									<xsl:for-each select="ncdt:RecordID">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<br/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ncdt:DocNumber">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="dateIn" select="."/>
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
</xsl:stylesheet>
