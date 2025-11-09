require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )

CoD.ScoreboardRowWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardRowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardRowWidget )
	self.id = "ScoreboardRowWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 802 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	Panel:setLeftRight( true, true, 0, -32 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0.48, 0.48, 0.48 )
	Panel.FEButtonPanel:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 0, 29 )
	Rank:setTopBottom( false, false, -12, 13 )
	Rank:setRGB( 1, 1, 1 )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( true, false, 30, 54 )
	RankIcon:setTopBottom( false, false, -12, 12 )
	RankIcon:setRGB( 1, 1, 1 )
	RankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( true, false, 63.41, 384.41 )
	Gamertag:setTopBottom( false, false, -13.5, 11.5 )
	Gamertag:setRGB( 1, 1, 1 )
	Gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ScoreColumn1 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1:setLeftRight( false, true, -463, -376 )
	ScoreColumn1:setTopBottom( true, true, 0, 0 )
	ScoreColumn1:setRGB( 1, 1, 1 )
	ScoreColumn1.BgNew:setRGB( 1, 1, 1 )
	ScoreColumn1.Bg:setAlpha( 0.3 )
	ScoreColumn1.Text:setRGB( 1, 1, 1 )
	ScoreColumn1.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn1 )
	self.ScoreColumn1 = ScoreColumn1
	
	local ScoreColumn2 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn2:setLeftRight( false, true, -376, -289 )
	ScoreColumn2:setTopBottom( true, true, 0, 0 )
	ScoreColumn2:setRGB( 1, 1, 1 )
	ScoreColumn2.BgNew:setRGB( 1, 1, 1 )
	ScoreColumn2.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn2.Bg:setAlpha( 0 )
	ScoreColumn2.Text:setRGB( 1, 1, 1 )
	ScoreColumn2.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn2 )
	self.ScoreColumn2 = ScoreColumn2
	
	local ScoreColumn3 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3:setLeftRight( false, true, -289, -202 )
	ScoreColumn3:setTopBottom( true, true, 0, 0 )
	ScoreColumn3:setRGB( 1, 1, 1 )
	ScoreColumn3.BgNew:setRGB( 1, 1, 1 )
	ScoreColumn3.Bg:setAlpha( 0.3 )
	ScoreColumn3.Text:setRGB( 1, 1, 1 )
	ScoreColumn3.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn3 )
	self.ScoreColumn3 = ScoreColumn3
	
	local ScoreColumn4 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn4:setLeftRight( false, true, -202, -115 )
	ScoreColumn4:setTopBottom( true, true, 0, 0 )
	ScoreColumn4:setRGB( 1, 1, 1 )
	ScoreColumn4.BgNew:setRGB( 1, 1, 1 )
	ScoreColumn4.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn4.Bg:setAlpha( 0 )
	ScoreColumn4.Text:setRGB( 1, 1, 1 )
	ScoreColumn4.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn4 )
	self.ScoreColumn4 = ScoreColumn4
	
	local ScoreColumn5 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5:setLeftRight( false, true, -115, -32 )
	ScoreColumn5:setTopBottom( true, true, 0, 0 )
	ScoreColumn5:setRGB( 1, 1, 1 )
	ScoreColumn5.BgNew:setRGB( 1, 1, 1 )
	ScoreColumn5.Bg:setAlpha( 0.3 )
	ScoreColumn5.Text:setRGB( 1, 1, 1 )
	ScoreColumn5.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( ScoreColumn5 )
	self.ScoreColumn5 = ScoreColumn5
	
	local PingBars = LUI.UIImage.new()
	PingBars:setLeftRight( false, true, -29.5, -7.67 )
	PingBars:setTopBottom( false, false, -11.34, 10.5 )
	PingBars:setRGB( 1, 1, 1 )
	PingBars:setAlpha( GetScoreboardPingBarAlpha( 1 ) )
	PingBars:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( PingBars )
	self.PingBars = PingBars
	
	self.Rank:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( Engine.Localize( GetScoreboardPlayerRank( modelValue ) ) )
		end
	end )
	self.RankIcon:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIcon:setImage( RegisterImage( GetScoreboardPlayerRankIcon( modelValue ) ) )
		end
	end )
	self.Gamertag:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Gamertag:setText( GetScoreboardPlayerName( modelValue ) )
		end
	end )
	self.ScoreColumn1:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn1.Bg:setRGB( GetScoreboardPlayerBackgroundColor( modelValue ) )
		end
	end )
	self.ScoreColumn1:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn1.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn1( modelValue ) ) )
		end
	end )
	self.ScoreColumn2:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn2.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn2( modelValue ) ) )
		end
	end )
	self.ScoreColumn3:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn3.Bg:setRGB( GetScoreboardPlayerBackgroundColor( modelValue ) )
		end
	end )
	self.ScoreColumn3:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn3.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn3( modelValue ) ) )
		end
	end )
	self.ScoreColumn4:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn4.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn4( modelValue ) ) )
		end
	end )
	self.ScoreColumn5:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn5.Bg:setRGB( GetScoreboardPlayerBackgroundColor( modelValue ) )
		end
	end )
	self.ScoreColumn5:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn5.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn5( modelValue ) ) )
		end
	end )
	self.PingBars:linkToElementModel( self, "clientInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PingBars:setImage( RegisterImage( GetScoreboardPlayerPingBarImage( modelValue ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Rank:completeAnimation()
				self.Rank:setRGB( 1, 1, 1 )
				self.clipFinished( Rank, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 1, 1 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1:setRGB( 1, 1, 1 )
				self.ScoreColumn1.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2:setRGB( 1, 1, 1 )
				self.ScoreColumn2.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3:setRGB( 1, 1, 1 )
				self.ScoreColumn3.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4:setRGB( 1, 1, 1 )
				self.ScoreColumn4.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5:setRGB( 1, 1, 1 )
				self.ScoreColumn5.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn5, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Rank:completeAnimation()
				self.Rank:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Rank, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1:setRGB( 1, 1, 1 )
				self.ScoreColumn1.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2:setRGB( 1, 1, 1 )
				self.ScoreColumn2.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3:setRGB( 1, 1, 1 )
				self.ScoreColumn3.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4:setRGB( 1, 1, 1 )
				self.ScoreColumn4.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5:setRGB( 1, 1, 1 )
				self.ScoreColumn5.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn5, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsScoreboardPlayerSelf( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "clientInfo", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientInfo"
		} )
	end )
	self.close = function ( self )
		self.Panel:close()
		self.ScoreColumn1:close()
		self.ScoreColumn2:close()
		self.ScoreColumn3:close()
		self.ScoreColumn4:close()
		self.ScoreColumn5:close()
		self.Rank:close()
		self.RankIcon:close()
		self.Gamertag:close()
		self.PingBars:close()
		CoD.ScoreboardRowWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

