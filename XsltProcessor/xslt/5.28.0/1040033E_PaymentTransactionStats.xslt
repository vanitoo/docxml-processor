<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_crd="urn:customs.ru:CardCommonAggregateTypes:5.21.0" xmlns:ptrs="urn:customs.ru:Information:ELSDocuments:PaymentTransactionStats:5.21.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0">
	<!-- Шаблон для типа PaymentTransactionStatsType -->
	<xsl:template match="ptrs:PaymentTransactionStats">
		<xsl:param name="w" select="270"/>
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
                  font-size: 9pt;
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
										<b>Информация об операциях, совершеных с использованием программных<br/>и (или) технических средств (устройств) в рамках платежной системы, оператором<br/>которой является оператор таможенных платежей</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div style="width:100%;text-align: center">Оператор таможенных платежей: <xsl:apply-templates select="ptrs:TransactionInfo/ptrs:PayerInfo/ptrs:OrganizationName"/></div>
					<div style="width:100%;text-align: center">за период с <xsl:apply-templates select="ptrs:PeriodBegin" mode="russian_date"/> по <xsl:apply-templates select="ptrs:PeriodEnd" mode="russian_date"/></div>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered" rowspan="3">№ п/п</td>
								<td class="bordered" rowspan="2" colspan="4">Плательщик</td>
								<td class="bordered" rowspan="2" colspan="2">Операции в отчетном периоде</td>
								<td class="bordered" colspan="8">в том числе с использованием:</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" colspan="2">удаленной оплаты</td>
								<td class="bordered" colspan="2">платежного теминала</td>
								<td class="bordered" colspan="2">электронного терминала</td>
								<td class="bordered" colspan="2">банкомата</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered">Наименование юридического лица или имя, фамилия, отчество (при наличии) физического лица (ИП)</td>
								<td class="bordered">ИНН<br/>(для лиц, состоящих на учете в налоговых органах Российской Федерации)</td>
								<td class="bordered">КПП<br/>(для юридических лиц, состоящих на учете в налоговых органах Российской Федерации)</td>
								<td class="bordered">Идентификатор лицевого счета (для лиц, не состоящих на учете в налоговых органах Российской Федерации)</td>
								<td class="bordered">Кол-во</td>
								<td class="bordered">Сумма<br/>(руб.)</td>
								<td class="bordered">Кол-во</td>
								<td class="bordered">Сумма<br/>(руб.)</td>
								<td class="bordered">Кол-во</td>
								<td class="bordered">Сумма<br/>(руб.)</td>
								<td class="bordered">Кол-во</td>
								<td class="bordered">Сумма<br/>(руб.)</td>
								<td class="bordered">Кол-во</td>
								<td class="bordered">Сумма<br/>(руб.)</td>
							</tr>
							<xsl:for-each select="ptrs:TransactionInfo">
								<xsl:variable name="rowspan" select="count(ptrs:PayerTransactionInfo)"/>
								<tr>
									<td class="bordered"><xsl:value-of select="position()"/></td>
									<td class="bordered">
										<xsl:apply-templates select="ptrs:PayerInfo/ptrs:OrganizationName"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ptrs:PayerInfo/ptrs:INN"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ptrs:PayerInfo/ptrs:KPP"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ptrs:PayerInfo/ptrs:TaxpayerId"/>
									</td>
									<td class="bordered"></td>
									<td class="bordered"></td>
									<td class="bordered"></td>
									<td class="bordered"></td>
									<td class="bordered">
										<xsl:for-each select="ptrs:PayerTransactionInfo[ptrs:TerminalKind = 2]">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="ptrs:Quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ptrs:PayerTransactionInfo[ptrs:TerminalKind = 2]">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="ptrs:Amount"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ptrs:PayerTransactionInfo[ptrs:TerminalKind = 1]">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="ptrs:Quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ptrs:PayerTransactionInfo[ptrs:TerminalKind = 1]">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="ptrs:Amount"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ptrs:PayerTransactionInfo[ptrs:TerminalKind = 3]">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="ptrs:Quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:for-each select="ptrs:PayerTransactionInfo[ptrs:TerminalKind = 3]">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="ptrs:Amount"/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td class="bordered" colspan="5">ИТОГО:</td>
								<td class="bordered"></td>
								<td class="bordered"></td>
								<td class="bordered"></td>
								<td class="bordered"></td>
								<td class="bordered"></td>
								<td class="bordered"></td>
								<td class="bordered"></td>
								<td class="bordered"></td>
								<td class="bordered"></td>
								<td class="bordered"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_crd:IdentityCardType -->
	<xsl:template match="ptrs:IdentityCard">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_crd:IdentityCardCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:for-each select="*">
								<xsl:if test="position()!=1">, </xsl:if>
								<xsl:choose>
									<xsl:when test="contains(local-name(), 'Date')">
										<xsl:apply-templates select="." mode="russian_date"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="."/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ptrs:PayerInfoType -->
	<xsl:template match="ptrs:PayerInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="($wdth div 2) - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование / ФИО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ptrs:OrganizationName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ptrs:OKSM">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Страна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ptrs:OKSM"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ptrs:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ptrs:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ptrs:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ptrs:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ptrs:TaxpayerId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ID иностранного лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ptrs:TaxpayerId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ptrs:IdentityCard">
				<div class="title marg-top">Документ, удостоверяющий личность</div>
				<div>
					<xsl:apply-templates select="ptrs:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ptrs:PayerTransactionInfoType -->
	<xsl:template match="ptrs:PayerTransactionInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:if test="position()!=1">
			<br/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="ptrs:TerminalKind='1'">
				<xsl:text>электронный терминал</xsl:text>
			</xsl:when>
			<xsl:when test="ptrs:TerminalKind='2'">
				<xsl:text>платежный терминал</xsl:text>
			</xsl:when>
			<xsl:when test="ptrs:TerminalKind='3'">
				<xsl:text>банкомат</xsl:text>
			</xsl:when>
			<xsl:when test="ptrs:TerminalKind='4'">
				<xsl:text>Зарезервировано</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="ptrs:TerminalKind"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="ptrs:RemotePaymentSign='0'">
				<xsl:text>оплата через электронный терминал</xsl:text>
			</xsl:when>
			<xsl:when test="ptrs:RemotePaymentSign='1'">
				<xsl:text>оплата через электронный терминал</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="ptrs:RemotePaymentSign"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> Кол-во: </xsl:text>
		<xsl:apply-templates select="ptrs:Quantity"/>
		<xsl:text> Сумма: </xsl:text>
		<xsl:apply-templates select="ptrs:Amount" mode="translate_number"/>
	</xsl:template>
	<!-- Шаблон для типа cat_crd:OrganizationBaseType -->
	<xsl:template match="ptrs:SystemOperator">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_crd:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_crd:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_crd:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_crd:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_crd:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_crd:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ptrs:TransactionInfoType -->
	<xsl:template match="ptrs:TransactionInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ptrs:PayerInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ptrs:PayerTransactionInfo">
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
	<xsl:template match="//*[local-name()='PaymentTransactionStats']//*" priority="-1">
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
