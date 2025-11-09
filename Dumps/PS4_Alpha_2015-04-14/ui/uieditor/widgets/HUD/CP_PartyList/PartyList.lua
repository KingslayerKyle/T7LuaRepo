require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_PlayerScore" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )

CoD.PartyList = InheritFrom( LUI.UIElement )
CoD.PartyList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PartyList )
	self.id = "PartyList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 266 )
	self:setTopBottom( true, false, 0, 97 )
	self.anyChildUsesUpdateState = true
	
	local playerScores = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	playerScores:makeFocusable()
	playerScores:setLeftRight( true, false, 4, 261 )
	playerScores:setTopBottom( true, false, 8, 90 )
	playerScores:setRGB( 1, 1, 1 )
	playerScores:setDataSource( "PlayerList" )
	playerScores:setWidgetType( CoD.PartyList_PlayerScore )
	playerScores:setVerticalCount( 4 )
	self:addElement( playerScores )
	self.playerScores = playerScores
	
	local Dot1 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot1:setLeftRight( true, false, 264.5, 268.5 )
	Dot1:setTopBottom( true, false, 92.25, 96.25 )
	Dot1:setRGB( 1, 1, 1 )
	Dot1:setZoom( 5 )
	Dot1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot1:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot1:setShaderVector( 1, 0, 0, 0, 0 )
	Dot1:setShaderVector( 2, 0, 0, 0, 0 )
	Dot1:setShaderVector( 3, 0, 0, 0, 0 )
	Dot1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot2 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot2:setLeftRight( true, false, 264.5, 268.5 )
	Dot2:setTopBottom( true, false, 2.25, 6.25 )
	Dot2:setRGB( 1, 1, 1 )
	Dot2:setZoom( 5 )
	Dot2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot2:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot2:setShaderVector( 1, 0, 0, 0, 0 )
	Dot2:setShaderVector( 2, 0, 0, 0, 0 )
	Dot2:setShaderVector( 3, 0, 0, 0, 0 )
	Dot2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot2 )
	self.Dot2 = Dot2
	
	local Dot3 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot3:setLeftRight( true, false, 89.5, 93.5 )
	Dot3:setTopBottom( true, false, 92.25, 96.25 )
	Dot3:setRGB( 1, 1, 1 )
	Dot3:setZoom( 5 )
	Dot3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot3:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot3:setShaderVector( 1, 0, 0, 0, 0 )
	Dot3:setShaderVector( 2, 0, 0, 0, 0 )
	Dot3:setShaderVector( 3, 0, 0, 0, 0 )
	Dot3:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot4 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot4:setLeftRight( true, false, 89.5, 93.5 )
	Dot4:setTopBottom( true, false, 2.25, 6.25 )
	Dot4:setRGB( 1, 1, 1 )
	Dot4:setZoom( 5 )
	Dot4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot4:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot4:setShaderVector( 1, 0, 0, 0, 0 )
	Dot4:setShaderVector( 2, 0, 0, 0, 0 )
	Dot4:setShaderVector( 3, 0, 0, 0, 0 )
	Dot4:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot4 )
	self.Dot4 = Dot4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 264.5, 268.5 )
				self.Dot1:setTopBottom( true, false, 92.25, 96.25 )
				self.clipFinished( Dot1, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 264.5, 268.5 )
				self.Dot2:setTopBottom( true, false, 2.25, 6.25 )
				self.clipFinished( Dot2, {} )
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 89.5, 93.5 )
				self.Dot3:setTopBottom( true, false, 92.25, 96.25 )
				self.clipFinished( Dot3, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 89.5, 93.5 )
				self.Dot4:setTopBottom( true, false, 2.25, 6.25 )
				self.clipFinished( Dot4, {} )
			end
		},
		PlayerCount_4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 4, 261 )
				self.playerScores:setTopBottom( true, false, 8, 90 )
				self.clipFinished( playerScores, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 264.5, 268.5 )
				self.Dot2:setTopBottom( true, false, 2.25, 6.25 )
				self.clipFinished( Dot2, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 89.5, 93.5 )
				self.Dot4:setTopBottom( true, false, 2.25, 6.25 )
				self.clipFinished( Dot4, {} )
			end
		},
		PlayerCount_3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 4, 261 )
				self.playerScores:setTopBottom( true, false, 29, 111 )
				self.clipFinished( playerScores, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 264.5, 268.5 )
				self.Dot2:setTopBottom( true, false, 20.25, 24.25 )
				self.clipFinished( Dot2, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 89.5, 93.5 )
				self.Dot4:setTopBottom( true, false, 20.25, 24.25 )
				self.clipFinished( Dot4, {} )
			end
		},
		PlayerCount_2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 4, 261 )
				self.playerScores:setTopBottom( true, false, 50, 132 )
				self.clipFinished( playerScores, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 264.5, 268.5 )
				self.Dot2:setTopBottom( true, false, 41.25, 45.25 )
				self.clipFinished( Dot2, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 89.5, 93.5 )
				self.Dot4:setTopBottom( true, false, 41.25, 45.25 )
				self.clipFinished( Dot4, {} )
			end
		},
		PlayerCount_1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				playerScores:completeAnimation()
				self.playerScores:setLeftRight( true, false, 4, 261 )
				self.playerScores:setTopBottom( true, false, 71, 153 )
				self.clipFinished( playerScores, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 264.5, 268.5 )
				self.Dot2:setTopBottom( true, false, 64.25, 68.25 )
				self.clipFinished( Dot2, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 89.5, 93.5 )
				self.Dot4:setTopBottom( true, false, 64.25, 68.25 )
				self.clipFinished( Dot4, {} )
			end
		}
	}
	playerScores.id = "playerScores"
	self.close = function ( self )
		self.playerScores:close()
		self.Dot1:close()
		self.Dot2:close()
		self.Dot3:close()
		self.Dot4:close()
		CoD.PartyList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

