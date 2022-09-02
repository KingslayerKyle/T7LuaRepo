-- ac575cffee532c6d90291816e31c6d30
-- This hash is used for caching, delete to decompile the file again

CoD.Pregame_BanProtectIndicator = InheritFrom( LUI.UIElement )
CoD.Pregame_BanProtectIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Pregame_BanProtectIndicator )
	self.id = "Pregame_BanProtectIndicator"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	
	local protected = LUI.UIImage.new()
	protected:setLeftRight( false, false, -13, 14 )
	protected:setTopBottom( true, false, 38, 70 )
	protected:setAlpha( 0 )
	protected:setImage( RegisterImage( "uie_t7_icon_pregame_protected2" ) )
	self:addElement( protected )
	self.protected = protected
	
	local banned = LUI.UIImage.new()
	banned:setLeftRight( false, false, -13, 14 )
	banned:setTopBottom( true, false, 38, 70 )
	banned:setAlpha( 0 )
	banned:setImage( RegisterImage( "uie_t7_icon_pregame_forced" ) )
	self:addElement( banned )
	self.banned = banned
	
	local line = LUI.UIImage.new()
	line:setLeftRight( true, false, 73.18, 108 )
	line:setTopBottom( true, false, 54.45, 56.45 )
	line:setAlpha( 0 )
	self:addElement( line )
	self.line = line
	
	local line0 = LUI.UIImage.new()
	line0:setLeftRight( true, false, 0.18, 35 )
	line0:setTopBottom( true, false, 54.45, 56.45 )
	line0:setRGB( 1, 0.17, 0.23 )
	line0:setAlpha( 0 )
	self:addElement( line0 )
	self.line0 = line0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				protected:completeAnimation()
				self.protected:setAlpha( 0 )
				self.clipFinished( protected, {} )

				banned:completeAnimation()
				self.banned:setAlpha( 0 )
				self.clipFinished( banned, {} )

				line:completeAnimation()
				self.line:setAlpha( 0 )
				self.clipFinished( line, {} )

				line0:completeAnimation()
				self.line0:setAlpha( 0 )
				self.clipFinished( line0, {} )
			end
		},
		Protected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				protected:completeAnimation()
				self.protected:setAlpha( 0.85 )
				self.clipFinished( protected, {} )

				banned:completeAnimation()
				self.banned:setAlpha( 0 )
				self.clipFinished( banned, {} )

				line:completeAnimation()
				self.line:setRGB( 0.66, 0.85, 0.16 )
				self.line:setAlpha( 0.8 )
				self.line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( line, {} )

				line0:completeAnimation()
				self.line0:setRGB( 0.66, 0.85, 0.16 )
				self.line0:setAlpha( 0.8 )
				self.line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( line0, {} )
			end
		},
		Banned = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				protected:completeAnimation()
				self.protected:setLeftRight( false, false, -13, 14 )
				self.protected:setTopBottom( true, false, 38, 70 )
				self.protected:setAlpha( 0 )
				self.clipFinished( protected, {} )

				banned:completeAnimation()
				self.banned:setRGB( 1, 1, 1 )
				self.banned:setAlpha( 0.85 )
				self.clipFinished( banned, {} )

				line:completeAnimation()
				self.line:setRGB( 1, 0.17, 0.23 )
				self.line:setAlpha( 0.8 )
				self.line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( line, {} )

				line0:completeAnimation()
				self.line0:setRGB( 1, 0.17, 0.23 )
				self.line0:setAlpha( 0.8 )
				self.line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( line0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Protected",
			condition = function ( menu, element, event )
				return ItemIsProtected( menu, element, controller )
			end
		},
		{
			stateName = "Banned",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

