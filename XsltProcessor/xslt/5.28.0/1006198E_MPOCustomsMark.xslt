<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:mpocm="urn:customs.ru:Information:CustomsDocuments:MPOCustomsMark:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<!--
	<xsl:param name="BusinessProcessType" select="'MPOExportTaxRefund'"/>
	-->
	<!---->
	<xsl:param name="BusinessProcessType"/>
	
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="mpocm:MPOCustomsMark">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Решение по МПО</title>
				<style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 8pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							font-family: Times new roman;
							}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tr>
							<td align="center" style="border:solid 0pt">
								<font face="Times new roman" size="4">
									<b>Решение по МПО</b>
								</font>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="border:solid 0pt">
								<xsl:text> </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="g" style="border:solid 0pt">Дата решения 
						<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="mpocm:DecisionDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<xsl:if test="mpocm:DecisionTime">
							<tr>
								<td class="g" style="border:solid 0pt">Время
						<xsl:value-of select="substring(mpocm:DecisionTime, 1, 8)"/>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="g" style="border:solid 0pt">
								<u>Решение:</u>
								<xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="mpocm:Decision='1'">отказ в выпуске товаров</xsl:when>
									<xsl:when test="mpocm:Decision='2'">выпуск товаров без уплаты таможенных платежей</xsl:when>
									<xsl:when test="mpocm:Decision='3'">требуется уплата таможенных платежей</xsl:when>
									<xsl:when test="mpocm:Decision='4'">подлежит таможенному контролю в рамках СУР</xsl:when>
									<!--xsl:when test="mpocm:Decision='5'">товары подлежат таможенному декларированию с применением декларации на товары</xsl:when-->
									<xsl:when test="mpocm:Decision='6'">выпуск товаров приостановлен в соответствии со ст. 124 ТК ЕАЭС</xsl:when>
									<xsl:when test="mpocm:Decision='7'">cрок выпуска товаров продлен</xsl:when>
									<xsl:when test="mpocm:Decision='8'">выпуск товаров разрешен (таможенные платежи уплачены)</xsl:when>
									<xsl:when test="mpocm:Decision='9'">автоматический выпуск возвращаемых товаров</xsl:when>
									<xsl:when test="mpocm:Decision='10'">выпуск возвращаемых товаров</xsl:when>
									<xsl:when test="mpocm:Decision='11'">отказе в автоматичсеком выпуске, проводится проверка ОИС</xsl:when>
									<xsl:when test="mpocm:Decision='12'">убытие разрешено</xsl:when>
									<xsl:when test="mpocm:Decision='13'">в убытии отказано</xsl:when>
									<xsl:when test="mpocm:Decision='14'">отказано в автовыпуске</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="mpocm:DecisionDescription"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<xsl:if test="mpocm:DecisionCode">
							<tr>
								<td class="g" style="border:solid 0pt">
									Код причины:
									<xsl:text> </xsl:text>
									<xsl:value-of select="mpocm:DecisionCode"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="mpocm:DecisionDescription">
							<tr>
								<td class="g" style="border:solid 0pt">
									Описание:
									<xsl:text> </xsl:text>
									<xsl:value-of select="mpocm:DecisionDescription"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="mpocm:RecommendationCode">
							<tr>
								<td class="g" style="border:solid 0pt">
									<u>Код рекомендации:</u>
									<xsl:text> </xsl:text>
									<xsl:value-of select="mpocm:RecommendationCode"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="mpocm:RecomDescription">
							<tr>
								<td class="g" style="border:solid 0pt">
									<u>Рекомендация:</u>
									<xsl:text> </xsl:text>
									<xsl:value-of select="mpocm:RecomDescription"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="mpocm:ProlongDate">
							<tr>
								<td class="g" style="border:solid 0pt">
									<u>Срок продления выпуска товаров:</u>
									<xsl:text> </xsl:text>
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpocm:ProlongDate"/></xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td style="border:solid 0pt"> </td>
						</tr>

						<tr>
							<td class="g" style="border:solid 0pt">
							
								<xsl:choose>
									<xsl:when test="$BusinessProcessType = 'MPOExportTaxRefund'">
										Номер МПО:
									</xsl:when>
									<xsl:otherwise>
										Регистрационный номер МПО:
									</xsl:otherwise>
								</xsl:choose>
								
								<xsl:choose>
									<xsl:when test="$BusinessProcessType = 'MPOExportTaxRefund'">
										<xsl:apply-templates select="mpocm:MPO_Registration/mpocm:MPO_Number"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="mpocm:MPO_Registration"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						
						
						<xsl:if test="mpocm:MPOReg or ($BusinessProcessType = 'MPOExportTaxRefund' and mpocm:DTReg)">
							<tr>
								<td class="g" style="border:solid 0pt">Регистрационный номер ЭД МПО:
									<xsl:choose>
										<xsl:when test="$BusinessProcessType = 'MPOExportTaxRefund' and mpocm:DTReg">
											<xsl:apply-templates select="mpocm:DTReg"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="mpocm:MPOReg"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$BusinessProcessType != 'MPOExportTaxRefund'">
							<xsl:if test="mpocm:DTReg">
								<tr>
									<td class="g" style="border:solid 0pt">Регистрационный номер ЭДТ (декларации на товары):
										<xsl:apply-templates select="mpocm:DTReg"/>
									</td>
								</tr>
							</xsl:if>
						</xsl:if>
						<tr>
							<td class="g" style="border:solid 0pt">Таможенный орган: 
						<xsl:value-of select="mpocm:Customs/cat_ru:Code"/>
								<xsl:if test="mpocm:Customs/cat_ru:OfficeName"> <xsl:value-of select="mpocm:Customs/cat_ru:OfficeName"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="g" style="border:solid 0pt">Должностное лицо:
						<xsl:value-of select="mpocm:CustomsPerson/cat_ru:PersonSurname"/> 
						<xsl:value-of select="mpocm:CustomsPerson/cat_ru:PersonName"/>
								<xsl:if test="mpocm:CustomsPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="mpocm:CustomsPerson/cat_ru:PersonMiddleName"/>
								</xsl:if>
								<xsl:if test="mpocm:CustomsPerson/cat_ru:PersonPost"> (<xsl:value-of select="mpocm:CustomsPerson/cat_ru:PersonPost"/>)</xsl:if>
							</td>
						</tr>
						<xsl:if test="mpocm:CustomsPerson/cat_ru:IssueDate">
							<tr>
								<td class="g" style="border:solid 0pt">
						Дата подписания 
						<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mpocm:CustomsPerson/cat_ru:IssueDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td style="border:solid 0pt"> </td>
						</tr>
						<xsl:if test="mpocm:Comments">
							<tr>
								<td class="g" style="border:solid 0pt">
									<u>Комментарии:</u> 
						<xsl:apply-templates select="mpocm:Comments"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа mpocm:MPORegType -->
	<xsl:template match="mpocm:MPOReg">
		<xsl:value-of select="mpocm:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="reestr_date">
			<xsl:with-param name="dateIn" select="mpocm:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="mpocm:MPO_Number"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="mpocm:DTReg">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="reestr_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
	<xsl:template match="mpocm:MPO_Registration">
		<xsl:if test="mpocm:CustomsCode">
			<xsl:value-of select="mpocm:CustomsCode"/>/</xsl:if>
		<xsl:if test="mpocm:RegistrationDate">
			<xsl:value-of select="substring(mpocm:RegistrationDate,9,2)"/>
			<xsl:value-of select="substring(mpocm:RegistrationDate,6,2)"/>
			<xsl:value-of select="substring(mpocm:RegistrationDate,3,2)"/>/</xsl:if>
		<xsl:value-of select="mpocm:MPO_Number"/>
	</xsl:template>
	<xsl:template name="reestr_date">
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
</xsl:stylesheet>
