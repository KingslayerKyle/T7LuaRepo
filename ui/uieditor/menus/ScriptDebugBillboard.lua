-- 1b4b25e107ec3add4650155649528d06
-- This hash is used for caching, delete to decompile the file again

LUI.hudMenuType.ScriptDebugBillboard = "hud"
LUI.createMenu.ScriptDebugBillboard = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ScriptDebugBillboard" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ScriptDebugBillboard.buttonPrompts" )
	local f1_local1 = self
	
	local BillboardBackground = LUI.UIImage.new()
	BillboardBackground:setLeftRight( true, false, 475, 805 )
	BillboardBackground:setTopBottom( true, false, 41, 114 )
	BillboardBackground:setAlpha( 0.1 )
	self:addElement( BillboardBackground )
	self.BillboardBackground = BillboardBackground
	
	local BillboardName = LUI.UIText.new()
	BillboardName:setLeftRight( true, false, 537.5, 783.5 )
	BillboardName:setTopBottom( true, false, 45, 63 )
	BillboardName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	BillboardName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BillboardName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BillboardName )
	self.BillboardName = BillboardName
	
	local BillboardNameLabel = LUI.UITightText.new()
	BillboardNameLabel:setLeftRight( true, false, 493.38, 529.38 )
	BillboardNameLabel:setTopBottom( true, false, 45, 63 )
	BillboardNameLabel:setText( Engine.Localize( "DEBUG_BILLBOARD_NAME" ) )
	BillboardNameLabel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( BillboardNameLabel )
	self.BillboardNameLabel = BillboardNameLabel
	
	local BillboardTypeLabel = LUI.UITightText.new()
	BillboardTypeLabel:setLeftRight( true, false, 499.38, 529.38 )
	BillboardTypeLabel:setTopBottom( true, false, 69.5, 85.5 )
	BillboardTypeLabel:setText( Engine.Localize( "DEBUG_BILLBOARD_TYPE" ) )
	BillboardTypeLabel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( BillboardTypeLabel )
	self.BillboardTypeLabel = BillboardTypeLabel
	
	local BillboardType = LUI.UIText.new()
	BillboardType:setLeftRight( true, false, 537.5, 783.5 )
	BillboardType:setTopBottom( true, false, 69.5, 85.5 )
	BillboardType:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	BillboardType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BillboardType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BillboardType )
	self.BillboardType = BillboardType
	
	local BillboardSizeLabel = LUI.UITightText.new()
	BillboardSizeLabel:setLeftRight( true, false, 501.38, 529.38 )
	BillboardSizeLabel:setTopBottom( true, false, 93, 111 )
	BillboardSizeLabel:setText( Engine.Localize( "DEBUG_BILLBOARD_SIZE" ) )
	BillboardSizeLabel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( BillboardSizeLabel )
	self.BillboardSizeLabel = BillboardSizeLabel
	
	local BillboardSize = LUI.UIText.new()
	BillboardSize:setLeftRight( true, false, 537.5, 783.5 )
	BillboardSize:setTopBottom( true, false, 93, 111 )
	BillboardSize:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	BillboardSize:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BillboardSize:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BillboardSize )
	self.BillboardSize = BillboardSize
	
	self.BillboardName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			BillboardName:setText( Engine.Localize( name ) )
		end
	end )
	self.BillboardType:linkToElementModel( self, "type", true, function ( model )
		local type = Engine.GetModelValue( model )
		if type then
			BillboardType:setText( Engine.Localize( type ) )
		end
	end )
	self.BillboardSize:linkToElementModel( self, "size", true, function ( model )
		local size = Engine.GetModelValue( model )
		if size then
			BillboardSize:setText( Engine.Localize( size ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			update = function ()
				self:setupElementClipCounter( 1 )
				local BillboardBackgroundFrame2 = function ( BillboardBackground, event )
					local BillboardBackgroundFrame3 = function ( BillboardBackground, event )
						local BillboardBackgroundFrame4 = function ( BillboardBackground, event )
							local BillboardBackgroundFrame5 = function ( BillboardBackground, event )
								local BillboardBackgroundFrame6 = function ( BillboardBackground, event )
									local BillboardBackgroundFrame7 = function ( BillboardBackground, event )
										local BillboardBackgroundFrame8 = function ( BillboardBackground, event )
											local BillboardBackgroundFrame9 = function ( BillboardBackground, event )
												local BillboardBackgroundFrame10 = function ( BillboardBackground, event )
													local BillboardBackgroundFrame11 = function ( BillboardBackground, event )
														local BillboardBackgroundFrame12 = function ( BillboardBackground, event )
															if not event.interrupted then
																BillboardBackground:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
															end
															BillboardBackground:setRGB( 1, 1, 1 )
															BillboardBackground:setAlpha( 0.12 )
															if event.interrupted then
																self.clipFinished( BillboardBackground, event )
															else
																BillboardBackground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															BillboardBackgroundFrame12( BillboardBackground, event )
															return 
														else
															BillboardBackground:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
															BillboardBackground:setAlpha( 0.72 )
															BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame12 )
														end
													end
													
													if event.interrupted then
														BillboardBackgroundFrame11( BillboardBackground, event )
														return 
													else
														BillboardBackground:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
														BillboardBackground:setAlpha( 0.28 )
														BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame11 )
													end
												end
												
												if event.interrupted then
													BillboardBackgroundFrame10( BillboardBackground, event )
													return 
												else
													BillboardBackground:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													BillboardBackground:setAlpha( 0.72 )
													BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame10 )
												end
											end
											
											if event.interrupted then
												BillboardBackgroundFrame9( BillboardBackground, event )
												return 
											else
												BillboardBackground:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
												BillboardBackground:setAlpha( 0.33 )
												BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame9 )
											end
										end
										
										if event.interrupted then
											BillboardBackgroundFrame8( BillboardBackground, event )
											return 
										else
											BillboardBackground:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											BillboardBackground:setAlpha( 0.7 )
											BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame8 )
										end
									end
									
									if event.interrupted then
										BillboardBackgroundFrame7( BillboardBackground, event )
										return 
									else
										BillboardBackground:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										BillboardBackground:setAlpha( 0.3 )
										BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame7 )
									end
								end
								
								if event.interrupted then
									BillboardBackgroundFrame6( BillboardBackground, event )
									return 
								else
									BillboardBackground:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									BillboardBackground:setAlpha( 0.7 )
									BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame6 )
								end
							end
							
							if event.interrupted then
								BillboardBackgroundFrame5( BillboardBackground, event )
								return 
							else
								BillboardBackground:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								BillboardBackground:setAlpha( 0.35 )
								BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame5 )
							end
						end
						
						if event.interrupted then
							BillboardBackgroundFrame4( BillboardBackground, event )
							return 
						else
							BillboardBackground:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							BillboardBackground:setAlpha( 0.67 )
							BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame4 )
						end
					end
					
					if event.interrupted then
						BillboardBackgroundFrame3( BillboardBackground, event )
						return 
					else
						BillboardBackground:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						BillboardBackground:setAlpha( 0.3 )
						BillboardBackground:registerEventHandler( "transition_complete_keyframe", BillboardBackgroundFrame3 )
					end
				end
				
				BillboardBackground:completeAnimation()
				self.BillboardBackground:setRGB( 1, 0, 0 )
				self.BillboardBackground:setAlpha( 0.7 )
				BillboardBackgroundFrame2( BillboardBackground, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BillboardName:close()
		element.BillboardType:close()
		element.BillboardSize:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ScriptDebugBillboard.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

