-- 9607380a8245a06228304ea37d683001
-- This hash is used for caching, delete to decompile the file again

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "MusicPlayer" )
	self.musictitle = Engine.CreateModel( f1_local0, "title" )
	self.musicartist = Engine.CreateModel( f1_local0, "artist" )
	self.musicartist2 = Engine.CreateModel( f1_local0, "artist2" )
	self.musicdisplaystate = Engine.CreateModel( f1_local0, "state" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.Details1Text:subscribeToModel( f2_arg0.musictitle, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.Details1Text:setText( modelValue )
		end
	end )
	f2_arg0.Details2Text:subscribeToModel( f2_arg0.musicartist, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.Details2Text:setText( modelValue )
		end
	end )
	f2_arg0.Details3Text:subscribeToModel( f2_arg0.musicartist2, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.Details3Text:setText( modelValue )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( f2_arg0, "close", function ( element )
		element.Details1Text:close()
		element.Details2Text:close()
		element.Details3Text:close()
	end )
end

CoD.MusicPlayerAppletDisplay = InheritFrom( LUI.UIElement )
CoD.MusicPlayerAppletDisplay.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MusicPlayerAppletDisplay )
	self.id = "MusicPlayerAppletDisplay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 209 )
	self:setTopBottom( true, false, 0, 66 )
	
	local beats = LUI.UIImage.new()
	beats:setLeftRight( true, false, 0, 209 )
	beats:setTopBottom( true, false, 21, 65 )
	beats:setAlpha( 0 )
	beats:setImage( RegisterImage( "uie_t7_menu_cp_datavault_beats" ) )
	beats:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	beats:setShaderVector( 0, 1, 1, 0, 0 )
	beats:setShaderVector( 1, 0.2, 0, 0, 0 )
	self:addElement( beats )
	self.beats = beats
	
	local stop = LUI.UIImage.new()
	stop:setLeftRight( true, false, -1.5, 57 )
	stop:setTopBottom( true, false, -4, 54.5 )
	stop:setAlpha( 0 )
	stop:setImage( RegisterImage( "uie_t7_menu_cp_datavault_stop" ) )
	self:addElement( stop )
	self.stop = stop
	
	local play = LUI.UIImage.new()
	play:setLeftRight( true, false, 6, 51 )
	play:setTopBottom( true, false, 3, 48 )
	play:setImage( RegisterImage( "uie_t7_menu_cp_datavault_musicplay" ) )
	self:addElement( play )
	self.play = play
	
	local Details1Text = LUI.UIText.new()
	Details1Text:setLeftRight( true, false, 55, 209 )
	Details1Text:setTopBottom( true, false, 16, 33 )
	Details1Text:setText( Engine.Localize( "CPUI_CP_MI_ETH_PROLOGUE" ) )
	Details1Text:setTTF( "fonts/escom.ttf" )
	Details1Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Details1Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( Details1Text )
	self.Details1Text = Details1Text
	
	local Details2Text = LUI.UIText.new()
	Details2Text:setLeftRight( true, false, 13, 97 )
	Details2Text:setTopBottom( true, false, 49, 61 )
	Details2Text:setText( Engine.Localize( "" ) )
	Details2Text:setTTF( "fonts/escom.ttf" )
	Details2Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Details2Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Details2Text )
	self.Details2Text = Details2Text
	
	local Details3Text = LUI.UIText.new()
	Details3Text:setLeftRight( true, false, 122, 201 )
	Details3Text:setTopBottom( true, false, 49, 61 )
	Details3Text:setText( Engine.Localize( "" ) )
	Details3Text:setTTF( "fonts/escom.ttf" )
	Details3Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Details3Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Details3Text )
	self.Details3Text = Details3Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		play = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local beatsFrame2 = function ( beats, event )
					if not event.interrupted then
						beats:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					beats:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( beats, event )
					else
						beats:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				beats:completeAnimation()
				self.beats:setAlpha( 0 )
				beatsFrame2( beats, {} )

				stop:completeAnimation()
				self.stop:setAlpha( 1 )
				self.clipFinished( stop, {} )

				play:completeAnimation()
				self.play:setAlpha( 0 )
				self.clipFinished( play, {} )
			end
		},
		stop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local beatsFrame2 = function ( beats, event )
					if not event.interrupted then
						beats:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					beats:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( beats, event )
					else
						beats:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				beats:completeAnimation()
				self.beats:setAlpha( 1 )
				beatsFrame2( beats, {} )

				stop:completeAnimation()
				self.stop:setAlpha( 0 )
				self.clipFinished( stop, {} )

				play:completeAnimation()
				self.play:setAlpha( 1 )
				self.clipFinished( play, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "play",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "MusicPlayer.state", "play" )
			end
		},
		{
			stateName = "stop",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "MusicPlayer.state", "stop" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MusicPlayer.state" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MusicPlayer.state"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

