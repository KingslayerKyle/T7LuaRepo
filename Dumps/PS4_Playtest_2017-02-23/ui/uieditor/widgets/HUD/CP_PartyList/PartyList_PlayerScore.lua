require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Panel" )
require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_PlayerScoreInternal" )

local PostLoadFunc = function ( self )
	self.updatePlayerScoreWidgetLayout = function ( self )
		local width = 0
		local addElementLocalRectWidth = function ( elem )
			local left, _, right, _ = elem:getLocalRect()
			width = width + right - left + 1
		end
		
		local addElementTextWidth = function ( elem )
			width = width + elem:getTextWidth() + 1
		end
		
		if 0 < self.ScoreInternal.ClanContainer.LblClan:getTextWidth() then
			addElementLocalRectWidth( self.ScoreInternal.ClanContainer )
		end
		addElementLocalRectWidth( self.ScoreInternal.ScoreRankIcon )
		addElementLocalRectWidth( self.ScoreInternal.voipCustomElement )
		addElementTextWidth( self.ScoreInternal.Gamertag )
		addElementTextWidth( self.ScoreInternal.LblRank )
		self.Panel:setLeftRight( false, true, -width - 5, 4 )
	end
	
end

CoD.PartyList_PlayerScore = InheritFrom( LUI.UIElement )
CoD.PartyList_PlayerScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PartyList_PlayerScore )
	self.id = "PartyList_PlayerScore"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 385 )
	self:setTopBottom( 0, 0, 0, 28 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.DamageWidget_Panel.new( menu, controller )
	Panel:setLeftRight( 0, 0, 134, 388 )
	Panel:setTopBottom( 0, 0, -2, 33 )
	Panel:setRGB( 0.79, 0.82, 0.85 )
	Panel:setZoom( -3 )
	Panel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	Panel:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local ScoreInternal = CoD.PartyList_PlayerScoreInternal.new( menu, controller )
	ScoreInternal:setLeftRight( 0, 0, -5, 381 )
	ScoreInternal:setTopBottom( 0, 0, 1, 28 )
	ScoreInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ScoreInternal:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	ScoreInternal:setShaderVector( 1, 0, 0, 0, 0 )
	ScoreInternal:setShaderVector( 2, 0, 0, 0, 0 )
	ScoreInternal:setShaderVector( 3, 0, 0, 0, 0 )
	ScoreInternal:setShaderVector( 4, 0, 0, 0, 0 )
	ScoreInternal:linkToElementModel( self, nil, false, function ( model )
		ScoreInternal:setModel( model, controller )
	end )
	self:addElement( ScoreInternal )
	self.ScoreInternal = ScoreInternal
	
	self.resetProperties = function ()
		ScoreInternal:completeAnimation()
		Panel:completeAnimation()
		ScoreInternal:setAlpha( 1 )
		ScoreInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
		ScoreInternal:setShaderVector( 0, 0.1, 0.5, 0, 0 )
		ScoreInternal:setShaderVector( 1, 0, 0, 0, 0 )
		ScoreInternal:setShaderVector( 2, 0, 0, 0, 0 )
		ScoreInternal:setShaderVector( 3, 0, 0, 0, 0 )
		ScoreInternal:setShaderVector( 4, 0, 0, 0, 0 )
		ScoreInternal.Gamertag:setRGB( 1, 1, 1 )
		ScoreInternal.ClanContainer:setRGB( 1, 1, 1 )
		ScoreInternal.LblRank:setRGB( 1, 1, 1 )
		Panel:setLeftRight( 0, 0, 134, 388 )
		Panel:setTopBottom( 0, 0, -2, 33 )
		Panel:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				ScoreInternal:completeAnimation()
				self.ScoreInternal:setAlpha( 0 )
				self.clipFinished( ScoreInternal, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setLeftRight( 0, 0, 134.5, 387.5 )
				self.Panel:setTopBottom( 0, 0, -2, 33 )
				self.clipFinished( Panel, {} )
				ScoreInternal:completeAnimation()
				ScoreInternal.Gamertag:completeAnimation()
				ScoreInternal.ClanContainer:completeAnimation()
				ScoreInternal.LblRank:completeAnimation()
				self.ScoreInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.ScoreInternal.Gamertag:setRGB( 0.99, 0.83, 0.03 )
				self.ScoreInternal.ClanContainer:setRGB( 0.99, 0.83, 0.03 )
				self.ScoreInternal.LblRank:setRGB( 0.99, 0.83, 0.03 )
				self.clipFinished( ScoreInternal, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel:close()
		self.ScoreInternal:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

