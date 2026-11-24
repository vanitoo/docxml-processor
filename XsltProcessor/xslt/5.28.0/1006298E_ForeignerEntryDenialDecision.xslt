<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:fsbngp="urn:customs.ru:Information:CustomsAuditDocuments:ForeignerEntryDenialDecision:5.28.0">
	
	<xsl:variable name="docKind" select="fsbngp:ForeignerEntryDenialDecision/fsbngp:DocKind"/>
	<xsl:template match="fsbngp:ForeignerEntryDenialDecision">
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
                  
                  .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					
					<xsl:call-template name="top_block"/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<b>
										<xsl:text>РЕШЕНИЕ №</xsl:text>
										<xsl:choose>
											<xsl:when test="$docKind = 1">
												<xsl:apply-templates select="fsbngp:DecisionNumber" mode="reg_num"/>
											</xsl:when>
											<xsl:when test="$docKind = 2">
												<xsl:apply-templates select="fsbngp:DecisionRepealNumber" mode="reg_num"/>
											</xsl:when>
										</xsl:choose>
										<br/>
										<xsl:choose>
											<xsl:when test="$docKind = 1">
												о неразрешении въезда в Российскую Федерацию в отношении<br/>
												иностранного гражданина или лица без гражданства
											</xsl:when>
											<xsl:when test="$docKind = 2">
												об отмене решения о неразрешении въезда<br/>
												в Российскую Федерацию в отношении иностранного гражданина<br/>
												или лица без гражданства
											</xsl:when>
										</xsl:choose>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="inlinetable">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="fsbngp:CustonsPerson"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(должность, наименование таможенного органа, специальное звание, Ф.И.О должностного лица)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<span>рассмотрев материалы (приложение на </span>
					<span style="display: inline-block; width:15mm; text-align:center; border-bottom:1px solid black;">
						<xsl:apply-templates select="fsbngp:SheetsNumber"/>
					</span>
					<span>л.) в отношении</span>
					<table class="inlinetable">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="fsbngp:Person"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(гражданство (если имеется), фамилия, имя, отчество (при наличии)<sup>1</sup>, реквизиты документа, удостоверяющего личность)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div style="width: 100%; text-align: center;">УСТАНОВИЛ:</div>
					<table class="inlinetable">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="fsbngp:DecisionReasons"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(указать обстоятельства, являющиеся основанием для 
									<xsl:choose>
										<xsl:when test="$docKind = 1">принятия</xsl:when>
										<xsl:when test="$docKind = 2">отмены</xsl:when>
									</xsl:choose>
									 решения о неразрешении въезда иностранного гражданина или лица без гражданства в Российскую Федерацию)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div style="width: 100%">
						<xsl:text>На основании изложенного</xsl:text>
						<xsl:if test="$docKind = 1">
							<xsl:text>, руководствуясь </xsl:text>
							<xsl:apply-templates select="fsbngp:LegalBasis"/>
							<xsl:text> Федерального закона от 15 августа 1996 г. № 114-ФЗ "О порядке выезда из Российской Федерации и въезда в Российскую Федерацию</xsl:text>
						</xsl:if>						
					</div>
					<br/>
					<div style="width: 100%; text-align: center;">РЕШИЛ:</div>
					<xsl:choose>
						<xsl:when test="$docKind = 1">Не разрешить въезд в Российскую Федерацию</xsl:when>
						<xsl:when test="$docKind = 2">Отменить решение о неразрешении въезда в Российскую Федерацию в отношении</xsl:when>
					</xsl:choose>
					<br/>
					<table class="inlinetable">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="fsbngp:Person">
										<xsl:with-param name="hasBirthday" select="'1'"/>
									</xsl:apply-templates>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(гражданство (если имеется), фамилия, имя, отчество (при наличии)<sup>1</sup>, дата рождения)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="inlinetable">
						<tbody>
							<tr align="center">
								<td class="value" width="80%">
									<xsl:apply-templates select="fsbngp:CustonsPerson"/>
									<br/>
								</td>
								<td class="value"/>
							</tr>
							<tr align="center">
								<td class="descr">
									(должность, наименование таможенного органа, специальное звание, Ф.И.О должностного лица)
								</td>
								<td class="descr">
									(подпись)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>
						<xsl:text>"</xsl:text>
						<span style="display:inline-block; width: 10mm; text-align:center; border-bottom: 1px solid black;">
							<xsl:value-of select="substring(fsbngp:ChiefCustonsPerson/cat_ru:IssueDate, 9, 2)"/>
						</span>
						<xsl:text>" </xsl:text>
						<span style="display:inline-block; width: 30mm; text-align:center; border-bottom: 1px solid black;">
							<xsl:variable name="month" select="substring(fsbngp:ChiefCustonsPerson/cat_ru:IssueDate, 6, 2)"/>
							<xsl:choose>
								<xsl:when test="$month = '01'">января</xsl:when>
								<xsl:when test="$month = '02'">февраля</xsl:when>
								<xsl:when test="$month = '03'">марта</xsl:when>
								<xsl:when test="$month = '04'">апреля</xsl:when>
								<xsl:when test="$month = '05'">мая</xsl:when>
								<xsl:when test="$month = '06'">июня</xsl:when>
								<xsl:when test="$month = '07'">июля</xsl:when>
								<xsl:when test="$month = '08'">августа</xsl:when>
								<xsl:when test="$month = '09'">сентября</xsl:when>
								<xsl:when test="$month = '10'">октября</xsl:when>
								<xsl:when test="$month = '11'">ноября</xsl:when>
								<xsl:when test="$month = '12'">декабря</xsl:when>
							</xsl:choose>
						</span>
						<xsl:text> 20</xsl:text>
						<span style="display:inline-block; width: 10mm; text-align:center; border-bottom: 1px solid black;">
							<xsl:value-of select="substring(fsbngp:ChiefCustonsPerson/cat_ru:IssueDate, 3, 2)"/>
						</span>
						<xsl:text> г.</xsl:text>
					</div>
					<br/>
					<br/>
					<div class="descr"><sup>1</sup> Указываются в соответствии с документом, удостоверяющим личность иностранного гражданина или лица без гражданства</div>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="fsbngp:LegalBasis">
		<xsl:if test="position() != 1">,</xsl:if>
		<xsl:if test="*[local-name() = 'DateNotification']">
			<xsl:text> подпунктом </xsl:text>
			<span style="display:inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:apply-templates select="*[local-name() = 'DateNotification']"/>
			</span>
		</xsl:if>
		<xsl:if test="*[local-name() = 'DateEnd']">
			<xsl:text> части </xsl:text>
			<span style="display:inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:apply-templates select="*[local-name() = 'DateEnd']"/>
			</span>
		</xsl:if>
		<xsl:text> статьи </xsl:text>
		<span style="display:inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
			<xsl:apply-templates select="*[local-name() = 'Fact']"/>
		</span>
	</xsl:template>
	<xsl:template match="fsbngp:Person">
		<xsl:param name="hasBirthday" select="'0'"/>
		<xsl:if test="*[local-name() = 'Citizenship']">
			<xsl:apply-templates select="*[local-name() = 'Citizenship']"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="*[local-name() = 'FamilyName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'FirstName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Patronymic']"/>
		<xsl:text>, </xsl:text>
		<xsl:if test="$hasBirthday = '0'">
			<xsl:apply-templates select="*[local-name() = 'IdentityCard']" mode="identity"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="$hasBirthday = '1'">
			<xsl:text>дата рождения </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'Birthday']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="identity">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'FullIdentityCardName']">
				<xsl:apply-templates select="*[local-name() = 'FullIdentityCardName']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="*[local-name() = 'IdentityCardName']"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> выдан </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
	</xsl:template>
	<xsl:template match="fsbngp:CustonsPerson">
		<xsl:if test="*[local-name() = 'PersonPost']">
			<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="../fsbngp:CustonsAuthority/cat_ru:OfficeName">
			<xsl:apply-templates select="../fsbngp:CustonsAuthority/cat_ru:OfficeName"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="*[local-name() = 'SpecialRank']">
			<xsl:apply-templates select="*[local-name() = 'SpecialRank']"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:for-each select="*[contains(local-name(), 'ame')]">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:choose>
			<xsl:when test="local-name() = 'DecisionNumber'">
				<xsl:text>З-</xsl:text>
			</xsl:when>
			<xsl:when test="local-name() = 'DecisionRepealNumber'">
				<xsl:text>О-</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	<xsl:template name="top_block">
		<table align="right" style="min-width: 40%; max-width:40%; width:40%;">
			<tbody>
				<tr>
					<td align="center">
						<span style="width:100%;">УТВЕРЖДАЮ</span>
					</td>
				</tr>
				<tr>
					<td>
						<table class="inlinetable">
							<tbody>
								<tr align="center">
									<td class="value">
										<xsl:apply-templates select="fsbngp:ChiefCustonsPerson/cat_ru:PersonPost"/>
										<br/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">
										(должность)
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="inlinetable">
							<tbody>
								<tr align="center">
									<td class="value">
										<xsl:apply-templates select="fsbngp:ChiefCustonsPerson/fsbngp:SpecialRank"/>
										<br/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">
										(специальное звание)
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="inlinetable">
							<tbody>
								<tr align="center">
									<td class="value">
										<xsl:apply-templates select="fsbngp:ChiefCustonsPerson" mode="IOFamily"/>
										<br/>
									</td>
								</tr>
								<tr align="right">
									<td class="descr">
										(подпись) <span style="display:inline-block;width:10mm;"/> (инициалы, фамилия)
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td align="right">
						<table class="inlinetable" style="max-width:60%; width:60%;">
							<tbody>
								<tr align="center">
									<td class="value">
										<xsl:apply-templates select="fsbngp:ChiefCustonsPerson/cat_ru:IssueDate" mode="russian_date"/>
										<br/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">
										(дата)
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="IOFamily">
		<xsl:value-of select="substring(*[local-name() = 'PersonName'], 1, 1)"/>
		<xsl:text>.</xsl:text>
		<xsl:if test="*[local-name() = 'PersonMiddleName']">
			<xsl:value-of select="substring(*[local-name() = 'PersonMiddleName'], 1, 1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
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
	<xsl:template match="//*[local-name()='ForeignerEntryDenialDecision']//*" priority="-1">
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
