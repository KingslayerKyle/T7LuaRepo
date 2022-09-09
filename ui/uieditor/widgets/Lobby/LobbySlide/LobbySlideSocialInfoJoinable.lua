-- 0efc6780fb30f652f525f3b62832e324
-- This hash is used for caching, delete to decompile the file again

CoD.LobbySlideSocialInfoJoinable = InheritFrom( LUI.UIElement )
CoD.LobbySlideSocialInfoJoinable.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideSocialInfoJoinable )
	self.id = "LobbySlideSocialInfoJoinable"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 185 )
	self:setTopBottom( true, false, 0, 24 )
	
	local MasterShieldIcon = LUI.UIImage.new()
	MasterShieldIcon:setLeftRight( true, false, 0, 16 )
	MasterShieldIcon:setTopBottom( false, false, -12, 12 )
	MasterShieldIcon:setImage( RegisterImage( "uie_t7_menu_frontend_iconjoinable" ) )
	self:addElement( MasterShieldIcon )
	self.MasterShieldIcon = MasterShieldIcon
	
	local MasterPowerRating = LUI.UIText.new()
	MasterPowerRating:setLeftRight( true, true, 28, 0 )
	MasterPowerRating:setTopBottom( true, false, 3, 21 )
	MasterPowerRating:setText( Engine.Localize( "PRESENCE_JOINABLE" ) )
	MasterPowerRating:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MasterPowerRating:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MasterPowerRating:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MasterPowerRating )
	self.MasterPowerRating = MasterPowerRating
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				MasterShieldIcon:completeAnimation()
				self.MasterShieldIcon:setAlpha( 0 )
				self.clipFinished( MasterShieldIcon, {} )

				MasterPowerRating:completeAnimation()
				self.MasterPowerRating:setAlpha( 0 )
				self.clipFinished( MasterPowerRating, {} )
			end
		},
		IsJoinable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				MasterShieldIcon:completeAnimation()
				self.MasterShieldIcon:setAlpha( 1 )
				self.clipFinished( MasterShieldIcon, {} )

				MasterPowerRating:completeAnimation()
				self.MasterPowerRating:setAlpha( 1 )
				self.clipFinished( MasterPowerRating, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
