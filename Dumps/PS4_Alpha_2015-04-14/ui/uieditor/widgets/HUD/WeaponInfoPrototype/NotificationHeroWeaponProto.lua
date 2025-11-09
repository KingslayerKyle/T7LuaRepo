require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.NotificationHeroWeaponImageProto" )

CoD.NotificationHeroWeaponProto = InheritFrom( LUI.UIElement )
CoD.NotificationHeroWeaponProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NotificationHeroWeaponProto )
	self.id = "NotificationHeroWeaponProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 185 )
	self.anyChildUsesUpdateState = true
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( false, false, -250, 250 )
	TextBox0:setTopBottom( true, false, 97.5, 145.5 )
	TextBox0:setRGB( 1, 0.82, 0.08 )
	TextBox0:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "HeroWeapon", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( AppendString( modelValue, " READY" ) ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local NotificationHeroWeaponImage = CoD.NotificationHeroWeaponImageProto.new( menu, controller )
	NotificationHeroWeaponImage:setLeftRight( true, false, 206, 294 )
	NotificationHeroWeaponImage:setTopBottom( true, false, 0, 103 )
	NotificationHeroWeaponImage:setRGB( 1, 1, 1 )
	self:addElement( NotificationHeroWeaponImage )
	self.NotificationHeroWeaponImage = NotificationHeroWeaponImage
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( false, false, -250, 250 )
	TextBox1:setTopBottom( true, false, 164.5, 184.5 )
	TextBox1:setRGB( 1, 1, 1 )
	TextBox1:setText( Engine.Localize( "MENU_HERO_WEAPON_PROMPT" ) )
	TextBox1:setTTF( "fonts/UnitedSansRgMd.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				NotificationHeroWeaponImage:completeAnimation()
				self.NotificationHeroWeaponImage:setAlpha( 0 )
				self.clipFinished( NotificationHeroWeaponImage, {} )
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 0 )
				self.clipFinished( TextBox1, {} )
			end,
			HeroWeaponReady = function ()
				self:setupElementClipCounter( 3 )
				local TextBox0Frame2 = function ( TextBox0, event )
					local TextBox0Frame3 = function ( TextBox0, event )
						local TextBox0Frame4 = function ( TextBox0, event )
							if not event.interrupted then
								TextBox0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							TextBox0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( TextBox0, event )
							else
								TextBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TextBox0Frame4( TextBox0, event )
							return 
						else
							TextBox0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
							TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame4 )
						end
					end
					
					if event.interrupted then
						TextBox0Frame3( TextBox0, event )
						return 
					else
						TextBox0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TextBox0:setAlpha( 1 )
						TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame3 )
					end
				end
				
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				TextBox0Frame2( TextBox0, {} )
				local NotificationHeroWeaponImageFrame2 = function ( NotificationHeroWeaponImage, event )
					local NotificationHeroWeaponImageFrame3 = function ( NotificationHeroWeaponImage, event )
						local NotificationHeroWeaponImageFrame4 = function ( NotificationHeroWeaponImage, event )
							if not event.interrupted then
								NotificationHeroWeaponImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							NotificationHeroWeaponImage:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( NotificationHeroWeaponImage, event )
							else
								NotificationHeroWeaponImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							NotificationHeroWeaponImageFrame4( NotificationHeroWeaponImage, event )
							return 
						else
							NotificationHeroWeaponImage:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
							NotificationHeroWeaponImage:registerEventHandler( "transition_complete_keyframe", NotificationHeroWeaponImageFrame4 )
						end
					end
					
					if event.interrupted then
						NotificationHeroWeaponImageFrame3( NotificationHeroWeaponImage, event )
						return 
					else
						NotificationHeroWeaponImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						NotificationHeroWeaponImage:setAlpha( 1 )
						NotificationHeroWeaponImage:registerEventHandler( "transition_complete_keyframe", NotificationHeroWeaponImageFrame3 )
					end
				end
				
				NotificationHeroWeaponImage:completeAnimation()
				self.NotificationHeroWeaponImage:setAlpha( 0 )
				NotificationHeroWeaponImageFrame2( NotificationHeroWeaponImage, {} )
				local TextBox1Frame2 = function ( TextBox1, event )
					local TextBox1Frame3 = function ( TextBox1, event )
						local TextBox1Frame4 = function ( TextBox1, event )
							if not event.interrupted then
								TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							TextBox1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( TextBox1, event )
							else
								TextBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TextBox1Frame4( TextBox1, event )
							return 
						else
							TextBox1:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
							TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame4 )
						end
					end
					
					if event.interrupted then
						TextBox1Frame3( TextBox1, event )
						return 
					else
						TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TextBox1:setAlpha( 1 )
						TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame3 )
					end
				end
				
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 0 )
				TextBox1Frame2( TextBox1, {} )
			end
		}
	}
	self.close = function ( self )
		self.NotificationHeroWeaponImage:close()
		self.TextBox0:close()
		CoD.NotificationHeroWeaponProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

